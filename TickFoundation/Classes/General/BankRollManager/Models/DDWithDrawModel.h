//
//  DDWithDrawModel.h
//  DidaShipper
//
//  Created by yangbo on 17/3/16.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseModel.h>

@interface DDWithDrawModel : BaseModel

@property (nonatomic , copy) NSString              * companyBankNo;
@property (nonatomic , copy) NSString              * status;
@property (nonatomic , copy) NSString              * createPerson;
@property (nonatomic , copy) NSString              * contactName;
@property (nonatomic , assign) NSInteger              withdraw_id;
@property (nonatomic , copy) NSString              * companyNo;
@property (nonatomic , copy) NSString              * companyTitle;
@property (nonatomic , copy) NSString              * auditRemark;
@property (nonatomic , assign) CGFloat              withdrawAmount;
@property (nonatomic , assign) NSInteger              company_id;
@property (nonatomic , copy) NSString              * companyBankAddress;
@property (nonatomic , copy) NSString              * companyName;
@property (nonatomic , copy) NSString              * auditDate;
@property (nonatomic , copy) NSString              * auditPerson;
@property (nonatomic , copy) NSString              * contactTele;
@property (nonatomic , copy) NSString              * create_person_id;
@property (nonatomic , copy) NSString              * createDate;
@property (nonatomic , copy) NSString              * audit_person_id;
@property (nonatomic , copy) NSString              * companyBankName;
@property (nonatomic, strong) NSString              *statusDesc;
@property (nonatomic, strong) NSString *            withdrawDfft;
@end
