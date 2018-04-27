//
//  SRPictureBrowser.m
//  SRPhotoBrowser
//
//  Created by Willing Guo on 16/12/24.
//  Copyright © 2016年 SR. All rights reserved.
//

#import "SRPictureBrowser.h"
#import "SRPictureModel.h"
#import "SRPictureCell.h"
#import "SRPictureView.h"
#import "SRPictureMacro.h"
#import "UIImage+SRImageEffects.h"
#import "SDWebImageManager.h"
#import "SDWebImagePrefetcher.h"

#define kPictureBrowserWidth   (SR_SCREEN_WIDTH + 10)

@interface SRPictureBrowser () <UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate, UIActionSheetDelegate, SRPictureViewDelegate>

@property (nonatomic, copy) NSArray *pictureModels;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl    *pageControl;

@property (nonatomic, strong) UIImageView *screenImageView;
@property (nonatomic, strong) UIImageView *screenBlurImageView;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, strong) SRPictureView *currentPictureView;

@end

@implementation SRPictureBrowser

#pragma mark - Initial

+ (instancetype)sr_pictureBrowserWithModels:(NSArray *)pictureModels currentIndex:(NSInteger)currentIndex {
    
    return [[self alloc] initWithModels:pictureModels currentIndex:currentIndex];
}

- (id)initWithModels:(NSArray *)pictureModels currentIndex:(NSInteger)index {
    
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        self.backgroundColor = [UIColor blackColor];
        
        _pictureModels = pictureModels;
        _currentIndex = index;
        
        for (SRPictureModel *picModel in _pictureModels) {
            if (picModel.index == _currentIndex) {
                picModel.firstShow = YES;
                break;
            }
        }
        
        [self setup];
    }
    return self;
}

- (void)setup {
    
    UIImage *screenImage = [self currentScreenImage];
    
    [self addSubview:({
        _screenBlurImageView = [[UIImageView alloc] initWithFrame:SR_SCREEN_BOUNDS];
        _screenBlurImageView.backgroundColor = [UIColor blackColor];
        _screenBlurImageView;
    })];
    
    [self addSubview:({
        _screenImageView = [[UIImageView alloc] initWithFrame:SR_SCREEN_BOUNDS];
        _screenImageView.image = screenImage;
        _screenImageView.hidden = YES;
        _screenImageView;
    })];
    
    [self addSubview:({
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(kPictureBrowserWidth, SR_SCREEN_HEIGHT);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0.0f;
        flowLayout.sectionInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kPictureBrowserWidth, self.bounds.size.height)
                                             collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        [_collectionView registerClass:[SRPictureCell class] forCellWithReuseIdentifier:pictureViewID];
        [_collectionView setContentOffset:CGPointMake(self.currentIndex * kPictureBrowserWidth, 0.0f) animated:NO];
        _collectionView;
    })];
    
//    [self addSubview:({
//        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, SR_SCREEN_HEIGHT - 40 - 10, SR_SCREEN_WIDTH, 40)];
//        _pageControl.numberOfPages = self.pictureModels.count;
//        _pageControl.currentPage = self.currentIndex;
//        _pageControl.userInteractionEnabled = NO;
//        _pageControl;
//    })];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.pictureModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SRPictureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:pictureViewID forIndexPath:indexPath];
    cell.pictureModel = self.pictureModels[indexPath.row];
    cell.pictureView.pictureViewDelegate = self;
    if (!_currentPictureView) {
        _currentPictureView = cell.pictureView;
    }
    return cell;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    NSInteger index = scrollView.contentOffset.x / SR_SCREEN_WIDTH;
    self.currentIndex = index;
    self.pageControl.currentPage = index;
    
    [self updateCurrentPictureView];
}

#pragma mark - SRPictureViewDelegate

- (void)pictureViewDidTapToDismissPictureBrowser {
    
    [self dismiss];
}

- (void)pictureViewDidLongPress {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"保存图片", nil];
    [actionSheet showInView:self];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        UIImageWriteToSavedPhotosAlbum(self.currentPictureView.imageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    
    if (!error) {
        NSLog(@"Save Image Success");
    } else {
        NSLog(@"Save Image Failure");
    }
}

#pragma mark - Assist Methods

- (void)show {
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)dismiss {
    
    _screenImageView.hidden = NO;
    
    self.currentPictureView.zoomScale = 1.0;
    
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.currentPictureView.imageView.frame = self.currentPictureView.pictureModel.originPosition;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
}

- (void)updateCurrentPictureView {
    
    NSArray *cells = [self.collectionView visibleCells];
    if (cells.count != 0) {
        SRPictureCell *cell = [cells objectAtIndex:0];
        if (self.currentPictureView != cell.pictureView) {
            self.currentPictureView = cell.pictureView;
            if (self.currentIndex + 1 < self.pictureModels.count) {
                SRPictureModel *nextModel = [self.pictureModels objectAtIndex:self.currentIndex + 1];
                [[SDWebImagePrefetcher sharedImagePrefetcher] prefetchURLs:@[[NSURL URLWithString:nextModel.picURLString]]];
            }
            if (self.currentIndex - 1 >= 0) {
                SRPictureModel *preModel = [self.pictureModels objectAtIndex:self.currentIndex - 1];
                [[SDWebImagePrefetcher sharedImagePrefetcher] prefetchURLs:@[[NSURL URLWithString:preModel.picURLString]]];
            }
        }
    }
}

- (UIImage *)currentScreenImage {
    
    UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].bounds.size, YES, [UIScreen mainScreen].scale);
    [[UIApplication sharedApplication].keyWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *currentScreenImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return currentScreenImage;
}

@end
