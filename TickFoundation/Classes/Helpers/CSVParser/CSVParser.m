//
//  CSVParser.m
//  Pods
//
//  Created by yangbo on 17/4/6.
//
//

#import "CSVParser.h"

@implementation CSVParser

+ (NSArray *)arrayWithCsvPath:(NSString *)path{
    NSString *text = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray *rstArray = [NSMutableArray array];
    
    NSArray *lines = [text componentsSeparatedByString:@"\n"];
    
    for (NSString *row in lines) {
        NSArray *items = [row componentsSeparatedByString:@","];
        [rstArray addObject:items];
    }
    return rstArray;
}

@end
