//
//  DDBankModel.m
//  DidaShipper
//
//  Created by yangbo on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDBankModel.h"

@implementation DDBankModel

-(id)copyWithZone:(NSZone *)zone{
    DDBankModel *model = [[[self class] allocWithZone:zone] init];
    
    model.companyBankId = self.companyBankId;
    model.companyBankZjxx = self.companyBankZjxx;
    model.companyBankNatureDis = self.companyBankNatureDis;
    model.companyTitle = self.companyTitle;
    model.contactName = self.contactName;
    model.contactTele = self.contactTele;
    model.companyNo = self.companyNo;
    model.companyBankName = self.companyBankName;
    model.companyBankNo = self.companyBankNo;
    model.companyBankAddress = self.companyBankAddress;
    model.status = self.status; //90有效
    model.createPersonName = self.createPersonName;
    model.createDate = self.createDate;
    model.updatePersonName = self.updatePersonName;
    model.updateDate = self.updateDate;
    
    model.accountType = self.accountType;
    model.companyBankNature = self.companyBankNature;
    
    return model;
}

@end
