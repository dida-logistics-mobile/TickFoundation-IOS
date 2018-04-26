//
//  FeedbackApi.h
//  Dida
//
//  Created by yangbo on 17/4/7.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseRequest.h>

@interface FeedbackApi : BaseRequest

@property (nonatomic) NSInteger ut; //0:"", 1:货主,2:司机,3:承运
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *un;
@property (nonatomic, strong) NSString *ph;
@property (nonatomic, strong) NSString *f1Path;
@end
