//
//  NetWorkConst.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 首页轮播图
extern NSString * const NetWorkMainBanner;

#pragma mark - 登录，注册，找回密码
///登录
extern NSString * const NetWorkLogin;
///发送验证码
extern NSString * const NetWotkGetSMSCode;
///验证码校验
extern NSString * const NetWorkAdjustCode;
///修改密码
extern NSString * const NetWorkEditPassword;
///用户注册
extern NSString * const NetWorkRegister;
///绑定新手机号
extern NSString * const NetWorkBindMobile;
///上传头像
extern NSString * const NetWorkUploadImage;
///修改头像
extern NSString * const NetWorkEditAvatar;

#pragma mark -- 商品列表及详情
///商品列表
extern NSString * const NetWorkProductionList;
///产品详情
extern NSString * const NetWorkProductionDetail;
///商品参数及详情
extern NSString * const NetWorkProductionMoreDetails;
///商品评价
extern NSString * const NetWorkProductionComments;
///收货地址添加
extern NSString * const NetWorkAddPostAddress;
///收货地址列表
extern NSString * const NetWorkPostAddressList;
///删除收货地址
extern NSString * const NetWorkDeletePostAddress;
///编辑收货地址
extern NSString * const NetWorkEditPostAddress;
///默认收货地址
extern NSString * const NetWorkDefaultPostAddress;


///用户个人信息
extern NSString * const NetWorkUserInfo;

///评论管理
extern NSString * const NetWorkAddComment;

#pragma mark -- 订单
/**
 * 根据订单状态查看订单：
 * NOT_PAID("待支付"), PAID("待发货")RECEIVING("待收货"), FINISH("已完 成"),APPRAISING("待评价") 不传表示查询5种状态的商品
 **/
extern NSString * const NetWorkOrderList;
///订单详情
extern NSString * const NetWorkOrderDetail;
///提醒发货
extern NSString * const NetWorkRemindPost;
///确认收货
extern NSString * const NetWorkConfirmRecieve;
///取消订单
extern NSString * const NetWorkCancelOrder;
///删除订单
extern NSString * const NetWorkDeleteOrder;

//提交订单
extern NSString * const NetWorkCreateOrder;
//订单支付成功
extern NSString * const NetWorkPayOrderSucc;

@interface NetWorkConst : NSObject

@end
