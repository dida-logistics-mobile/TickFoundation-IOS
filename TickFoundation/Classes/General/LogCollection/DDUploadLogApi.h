//
//  DDUploadLogApi.h
//  DidaShipper
//
//  Created by yangbo on 17/4/6.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseRequest.h>

@interface DDUploadLogApi : BaseRequest

@property (nonatomic, strong) NSArray *logs;
@property (nonatomic) NSInteger ut;

@end
