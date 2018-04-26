//
//  StatsEventManager.h
//  DidaShipper
//
//  Created by yangbo on 17/4/5.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDPublicMacro.h"

///埋点统计
@interface DDStatsEventManager : NSObject

SYNTHESIZE_SINGLETON_FOR_CLASS_HEADER

- (void)loadStatsJsonFileWithPath:(NSString *)path;

- (NSString *)nameWithStatsId:(NSString *)statsId;

@end
