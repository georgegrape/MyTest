//
//  NSFileManager+PPCategory.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "NSFileManager+PPCategory.h"
#import "NSArray+PPCategory.h"
@implementation NSFileManager (PPCategory)
-(NSString *)cacheDirectoryPath
{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

-(NSString *)documentsDirectoryPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths firstObject];
}

- (void)createDirectoryIfNeeded:(NSString *)dirPath
{
    if (![self fileExistsAtPath:dirPath]) {
        NSError *cErr = nil;
        [self createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&cErr];
    }
}
@end
