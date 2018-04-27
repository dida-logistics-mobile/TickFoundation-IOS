//
//  DDCheckVerifationApi.h
//  DidaShipper
//
//  Created by yangbo on 17/3/29.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseRequest.h>

@interface DDCheckVerifationApi : BaseRequest

@property (nonatomic, strong) NSString *roleType;
@property (nonatomic, strong) NSString *verification;
@property (nonatomic, strong) NSDictionary *wholeParamDic;
@property (nonatomic, strong) NSString *contactTele;

@end
