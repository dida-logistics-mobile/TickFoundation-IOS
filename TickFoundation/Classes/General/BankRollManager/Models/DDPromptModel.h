//
//  DDPromptModel.h
//  DidaShipper
//
//  Created by yangbo on 17/3/18.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseModel.h>

///公司账户信息
@interface DDPromptModel : BaseModel

@property (nonatomic, strong) NSString *receiveMsg;
@property (nonatomic, strong) NSString *receiveName;
@property (nonatomic, strong) NSString *receiveAccount;
@property (nonatomic, strong) NSString *receiveAccountNo;

@end
