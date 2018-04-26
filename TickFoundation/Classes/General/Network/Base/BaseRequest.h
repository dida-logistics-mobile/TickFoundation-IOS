//
//  BaseRequest.h
//  Dida
//
//  Created by yangbo on 16/12/6.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>
#import "BaseResponse.h"

extern NSInteger successCode ; //成功
extern NSInteger failureCode ; //失败
extern NSInteger refreshCode; //刷新
extern NSInteger notExistCode; //不存在
extern NSInteger alreadyExistCode; //已存在
extern NSInteger notLoginCode; //未登录
extern NSInteger notInfoAdd; //未维护
extern NSInteger notInfoAudit; //未审核
extern NSInteger dialogCode; //对话框
extern NSInteger networkErrorCode; //网络错误

@interface BaseRequest : YTKRequest

///获取解析后结果
- (BaseResponse *)parseResponseData;

- (Class)responseClass;

- (void)decodeData:(id)data response:(BaseResponse *)response;

@end
