//
//  DDBankDetailInfoApi.m
//  Pods
//
//  Created by yangbo on 2017/6/17.
//
//

#import "DDBankDetailInfoApi.h"
#import "DDPublicMacro.h"
#import "NSString+Extension.h"

@implementation DDBankDetailInfoApi

- (NSString *)requestUrl{
    return @"/dida/admin/capital.bankAccountInfo";
}

-(id)requestArgument{
    NSMutableDictionary *dic = [super requestArgument];
    dic[@"roleType"] = NilToEmptyString(_roleType);
    dic[@"companyBankId"] = NilToEmptyString(_companyBankId);
    
    NSString *postData = [NSString dd_jsonString:dic];
    if (postData) {
        return @{@"postdata":postData};
    }else{
        return nil;
    }
}

- (Class)responseClass{
    return [DDBankDetailInfoResponse class];
}

- (void)decodeData:(id)data response:(BaseResponse *)response{
    if(![data isKindOfClass:[NSDictionary class]]){
        return;
    }
    DDBankDetailInfoResponse *rsp = (DDBankDetailInfoResponse *)response;
    rsp.model = [[DDBankModel alloc] initWithDictionary:data error:nil];
}

@end

@implementation DDBankDetailInfoResponse

@end

