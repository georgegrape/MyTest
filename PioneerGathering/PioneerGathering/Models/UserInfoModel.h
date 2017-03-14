//
//  UserInfoModel.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface UserInfoModel : JSONModel

@property (nonatomic, copy)NSString<Optional> *userid;
// 用户名
@property (nonatomic, copy)NSString<Optional> *name;
// 手机号
@property (nonatomic, copy)NSString<Optional> *mobile;
// 头像
@property (nonatomic, copy)NSString<Optional> *imgUrl;
// 性别
@property (nonatomic, copy)NSString<Optional> *gender;
// 身份证号(可根据身份证来判断用户类型)
@property (nonatomic, copy)NSString<Optional> *idCard;
// 生日
@property (nonatomic, copy)NSString<Optional> *birthday;

@end
