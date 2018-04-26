//
//  StatsEventManager.m
//  DidaShipper
//
//  Created by yangbo on 17/4/5.
//  Copyright © 2017年 Dida. All rights reserved.
//

#import "DDStatsEventManager.h"
#import "CSVParser.h"

@implementation DDStatsEventManager
{
    NSMutableDictionary *_statsDic;
}

DEFINE_SINGLETON_FOR_CLASS(DDStatsEventManager)

- (void)loadStatsJsonFileWithPath:(NSString *)path{
    NSArray *array = [CSVParser arrayWithCsvPath:path];
    
    _statsDic = [[NSMutableDictionary alloc] init];
    [array enumerateObjectsUsingBlock:^(NSArray *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(obj.count > 0){
            NSString *statsId = obj.firstObject;
            if(obj.count > 1){
                NSString *name = obj[1];
                _statsDic[statsId] = name;
            }
        }
    }];
}

- (NSString *)nameWithStatsId:(NSString *)statsId{
    if(statsId == nil)
        return nil;
    return _statsDic[statsId];
}

@end
