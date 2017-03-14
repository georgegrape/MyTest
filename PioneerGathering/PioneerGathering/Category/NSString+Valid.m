//
//  NSString+Valid.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "NSString+Valid.h"

@implementation NSString (Valid)

- (BOOL)isEmpty {
    if ([self length] <= 0 || self == (id)[NSNull null]) {
        return YES;
    }
    return NO;
}

@end
