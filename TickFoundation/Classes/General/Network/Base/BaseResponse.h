//
//  BaseResponse.h
//  VCloudChat
//
//  Created by palmwin on 16/9/19.
//  Copyright © 2016年 Handwin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResponse : NSObject

@property (nonatomic) NSInteger code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic) NSInteger itemCount;
@property (nonatomic,strong) NSString *authoritys;

- (void)decodeResponseJsonObject:(id)json;

@end
