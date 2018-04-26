//
//  DDAliOSSManager.m
//  Dida
//
//  Created by yangbo on 17/5/4.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDAliOSSManager.h"
#import <AliyunOSSiOS/AliyunOSSiOS.h>
#import "DDBatchOSSTask.h"
#import "LoggerManager.h"
#import "NSDate+Extension.h"
#import "NSString+Extension.h"

static NSString *endPoint = @"oss-cn-hangzhou.aliyuncs.com";
static NSString *testPicBucketName = @"dida-test-pic";
static NSString *picBucketName = @"dida-pic";

@implementation DDAliOSSManager
{
    OSSClient *_client;
    BOOL _isDebug;
}

DEFINE_SINGLETON_FOR_CLASS(DDAliOSSManager)

- (void)startWithDebug:(BOOL)debug host:(NSString *)host{
    
    if(_client){
        DDLogError(@"OSS|已经初始化");
        return;
    }
    
    _isDebug = debug;
    id<OSSCredentialProvider> credential = [[OSSFederationCredentialProvider alloc] initWithFederationTokenGetter:^OSSFederationToken * {
        NSURL * url = [NSURL URLWithString:[host stringByAppendingPathComponent:@"/dida/admin/oss.getToken"]];
        NSURLRequest * request = [NSURLRequest requestWithURL:url];
        OSSTaskCompletionSource * tcs = [OSSTaskCompletionSource taskCompletionSource];
        NSURLSession * session = [NSURLSession sharedSession];
        NSURLSessionTask * sessionTask = [session dataTaskWithRequest:request
                                                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                        if (error) {
                                                            [tcs setError:error];
                                                            return;
                                                        }
                                                        [tcs setResult:data];
                                                    }];
        [sessionTask resume];
        [tcs.task waitUntilFinished];
        if (tcs.task.error) {
            return nil;
        } else {
            NSDictionary * object = [NSJSONSerialization JSONObjectWithData:tcs.task.result
                                                                    options:kNilOptions
                                                                      error:nil];
            OSSFederationToken * token = [OSSFederationToken new];
            token.tAccessKey = [object objectForKey:@"accessKeyId"];
            token.tSecretKey = [object objectForKey:@"accessKeySecret"];
            token.tToken = [object objectForKey:@"securityToken"];
            token.expirationTimeInGMTFormat = [object objectForKey:@"expiration"];
            return token;
        }
    }];
    _client = [[OSSClient alloc] initWithEndpoint:endPoint credentialProvider:credential];
}

- (NSString *)picBucketName{
    if(_isDebug){
        return testPicBucketName;
    }else{
        return picBucketName;
    }
}

- (NSString *)randomImageObjectKey{
    NSString *date = [[NSDate date] dd_stringWithFormat:@"yyyyMM"];
    return [NSString stringWithFormat:@"%@/%@",date,[[[NSString dd_randomUUIDString] lowercaseString] stringByAppendingString:@".jpg"]];
}

- (void)uploadImage:(UIImage *)image complete:(void(^)(BOOL success,NSString *objectKey,NSError *error))complete{
    OSSPutObjectRequest * put = [OSSPutObjectRequest new];
    put.bucketName = [self picBucketName];
    put.objectKey = [self randomImageObjectKey];
    
    NSData *data = UIImageJPEGRepresentation(image, .5);
    put.uploadingData = data;
    
    OSSTask * putTask = [_client putObject:put];
    [putTask continueWithBlock:^id(OSSTask *task) {
        if (!task.error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                complete(YES,put.objectKey,nil);
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                complete(NO,nil,task.error);
            });
        }
        return nil;
    }];
}

- (void)uploadImages:(NSArray *)images
            complete:(void(^)(BOOL success,NSArray *objectKeys,NSError *error))complete{
    
    NSMutableArray *tasks = [[NSMutableArray alloc] init];
    NSMutableArray *objectKeys = [[NSMutableArray alloc] init];
    for(int i = 0; i < images.count; i++){
        OSSPutObjectRequest * put = [OSSPutObjectRequest new];
        put.bucketName = [self picBucketName];
        put.objectKey = [self randomImageObjectKey];
        
        [objectKeys addObject:put.objectKey];
        
        NSData *data = UIImageJPEGRepresentation(images[i], .5);
        put.uploadingData = data;
        
        OSSTask * putTask = [_client putObject:put];
        [tasks addObject:putTask];
    }
    
    DDBatchOSSTask *batchTask = [[DDBatchOSSTask alloc] init];
    [batchTask startWithOSSTasks:tasks complete:^(BOOL success, NSArray *tasks, NSError *error) {
        if(complete){
            dispatch_async(dispatch_get_main_queue(), ^{
                complete(success,objectKeys,error);
            });
        }
    }];
}

@end
