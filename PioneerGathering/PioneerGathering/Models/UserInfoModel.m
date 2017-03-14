//
//  UserInfoModel.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "UserInfoModel.h"

@implementation UserInfoModel

+(JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"id" : @"userid"}];
}

@end
