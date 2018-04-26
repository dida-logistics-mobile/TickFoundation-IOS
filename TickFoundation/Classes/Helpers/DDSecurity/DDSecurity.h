//
//  DDSecurity.h
//  Dida
//
//  Created by yangbo on 16/12/13.
//  Copyright © 2016年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DDSecurity : NSObject

///md5
+ (NSString *)md5WithString:(NSString *)string;

///md5
+ (NSData *)md5WithData:(NSData *)data;

///aes256 encode
+ (NSData *)aes256EncryptWithData:(NSData *)data key:(NSString *)key;

///aes256 decode
+ (NSData *)aes256DecryptWithData:(NSData *)data key:(NSString *)key;

///aes256 encode
+ (NSString *)aes256EncryptWithString:(NSString *)string key:(NSString *)key;

///aes256 decode
+ (NSString *)aes256DecryptWithString:(NSString *)string key:(NSString *)key;

@end
