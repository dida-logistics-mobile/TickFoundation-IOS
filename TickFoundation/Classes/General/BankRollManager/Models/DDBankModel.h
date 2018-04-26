//
//  DDBankModel.h
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <DiDaFoundation/BaseModel.h>

#define BankAccountPersonal     @"0"
#define BankAccountCompany      @"1"
#define BankAccountUnknown      @"2"

///银行账户信息
@interface DDBankModel : BaseModel

@property (nonatomic, strong) NSString *companyBankId;
@property (nonatomic, strong) NSString *companyBankZjxx;
@property (nonatomic, strong) NSString *companyBankNatureDis;
@property (nonatomic, strong) NSString *companyTitle;
@property (nonatomic, strong) NSString *contactName;
@property (nonatomic, strong) NSString *contactTele;
@property (nonatomic, strong) NSString *companyNo;
@property (nonatomic, strong) NSString *companyBankName;
@property (nonatomic, strong) NSString *companyBankNo;
@property (nonatomic, strong) NSString *companyBankAddress;
@property (nonatomic, strong) NSString *status; //90有效
@property (nonatomic, strong) NSString *createPersonName;
@property (nonatomic, strong) NSString *createDate;
@property (nonatomic, strong) NSString *updatePersonName;
@property (nonatomic, strong) NSString *updateDate;

@property (nonatomic, strong) NSString *accountType; //账户类型（0：个人账户；1：公司账户）
@property (nonatomic, strong) NSString *companyBankNature;

@end
