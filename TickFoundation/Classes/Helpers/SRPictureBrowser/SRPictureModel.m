//
//  SRPictureModel.m
//  SRPhotoBrowser
//
//  Created by Willing Guo on 16/12/24.
//  Copyright © 2016年 SR. All rights reserved.
//

#import "SRPictureModel.h"
#import "SRPictureMacro.h"

@interface SRPictureModel ()

@property (nonatomic, assign, readwrite) CGRect destinationPosition;

@end

@implementation SRPictureModel

+ (id)sr_pictureModelWithPicURLString:(NSString *)picURLString
                        containerView:(UIView *)containerView
                  positionInContainer:(CGRect)positionInContainer
                                index:(NSInteger)index
{
    SRPictureModel *pictureModel = [[SRPictureModel alloc] init];
    pictureModel.picURLString = picURLString;
    
    if (containerView) {
        pictureModel.originPosition = [containerView convertRect:positionInContainer
                                                          toView:[UIApplication sharedApplication].keyWindow];
    } else {
        pictureModel.originPosition = CGRectMake(SR_SCREEN_WIDTH * 0.5, SR_SCREEN_HEIGHT * 0.5, 0, 0);
    }
    pictureModel.index = index;
    
    [self calculateDestinationPositionWithPictureModel:pictureModel];
    return pictureModel;
}

+ (id)sr_pictureModelWithPic:(UIImage *)image
               containerView:(UIView *)containerView
         positionInContainer:(CGRect)positionInContainer
                       index:(NSInteger)index{
    SRPictureModel *pictureModel = [[SRPictureModel alloc] init];
    pictureModel.image = image;
    
    if (containerView) {
        pictureModel.originPosition = [containerView convertRect:positionInContainer
                                                          toView:[UIApplication sharedApplication].keyWindow];
    } else {
        pictureModel.originPosition = CGRectMake(SR_SCREEN_WIDTH * 0.5, SR_SCREEN_HEIGHT * 0.5, 0, 0);
    }
    pictureModel.index = index;
    
    [self calculateDestinationPositionWithPictureModel:pictureModel];
    return pictureModel;

}

+ (void)calculateDestinationPositionWithPictureModel:(SRPictureModel *)pictureModel {
    
    CGSize imageSize = pictureModel.image ? pictureModel.image.size : pictureModel.originPosition.size;
    
    CGFloat destinationPositionW = SR_SCREEN_WIDTH;
    CGFloat destinationPositionH = imageSize.height * SR_SCREEN_WIDTH / imageSize.width;
    if (destinationPositionH > SR_SCREEN_HEIGHT) {
        destinationPositionW = imageSize.width;
        destinationPositionH = imageSize.height;
    }
    CGFloat destinationPositionX = 0;
    CGFloat destinationPositionY = (SR_SCREEN_HEIGHT - destinationPositionH) * 0.5;
    pictureModel.destinationPosition = CGRectMake(destinationPositionX, destinationPositionY, destinationPositionW, destinationPositionH);
}

@end
