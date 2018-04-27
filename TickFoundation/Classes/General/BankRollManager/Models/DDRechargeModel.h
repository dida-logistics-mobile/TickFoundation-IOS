//
//  DDRechargeModel.h
//  DidaShipper
//
//  Created by 李龙飞 on 17/3/14.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseModel.h>
///充值列表信息
@interface DDRechargeModel : BaseModel

@property (nonatomic , copy) NSString              * rechargePicPath;
@property (nonatomic , copy) NSString              * create_person_id;
@property (nonatomic , copy) NSString              * audit_person_id;
@property (nonatomic , assign) NSInteger              company_id;
@property (nonatomic , assign) CGFloat              rechargeAmount;
@property (nonatomic , copy) NSString              * createPerson;
@property (nonatomic , copy) NSString              * createDate;
@property (nonatomic , copy) NSString              * auditPerson;
@property (nonatomic , copy) NSString              * statusDesc;
@property (nonatomic , copy) NSString              * auditRemark;
@property (nonatomic , copy) NSString              * companyName;
@property (nonatomic , copy) NSString              * createRemark;
@property (nonatomic , assign) NSInteger              remit_money_id;
@property (nonatomic , copy) NSString              * auditDate;
@property (nonatomic , copy) NSString              * status;



@end
