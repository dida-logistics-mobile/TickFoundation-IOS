//
//  DDAccountFlowModel.h
//  DidaShipper
//
//  Created by yangbo on 17/3/16.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <TickFoundation/BaseModel.h>

@interface DDAccountFlowModel : BaseModel

@property (nonatomic , copy) NSString              * create_person_name;
@property (nonatomic , copy) NSString              * docuType; //10-充值,20-提现,30-支出,40-收入,50-返利,60-贴息,70-其他,80-综合费用,未知
@property (nonatomic , copy) NSString              * create_person_id;
@property (nonatomic , assign) CGFloat              amount;
@property (nonatomic , assign) NSInteger              company_id;
@property (nonatomic , copy) NSString              * docuMemo;
@property (nonatomic , copy) NSString              * modify_date;
@property (nonatomic , copy) NSString              * createDate;
@property (nonatomic , copy) NSString              * docuTypeDesc;
@property (nonatomic , assign) NSInteger              capital_detail_id;
@property (nonatomic , copy) NSString              * companyName;
@property (nonatomic , copy) NSString              * platform_id;
@property (nonatomic , copy) NSString              * docu_id;
@property (nonatomic , copy) NSString              * docuNum;
@property (nonatomic , assign) CGFloat              out_amount;
@property (nonatomic , assign) CGFloat              in_amount;
@property (nonatomic , copy) NSString              *capitalTypeDesc;

@end
