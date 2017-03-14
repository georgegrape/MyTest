//
//  NetWorkConst.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "NetWorkConst.h"

///首页轮播图 1
NSString * const NetWorkMainBanner = @"remote/banners";

#pragma mark - 登录，注册，找回密码
///登录 9
NSString * const NetWorkLogin = @"remote/login";
///获取验证码 6
NSString * const NetWotkGetSMSCode = @"romote/sms";
///验证码校验 15
NSString * const NetWorkAdjustCode = @"remote/validateCode";
///修改密码 8
NSString * const NetWorkEditPassword = @"remote/changePwd";
///用户注册 7
NSString * const NetWorkRegister = @"remote/register";
///绑定新手机号 16
NSString * const NetWorkBindMobile = @"remote/bindMobile";
///上传头像 17
NSString * const NetWorkUploadImage = @"remote/uploadImg";
///修改头像 18
NSString * const NetWorkEditAvatar = @"remote/updateUser";

#pragma mark -- 商品列表及详情
///商品列表 2
 NSString * const NetWorkProductionList = @"remote/products";
///产品详情 3
NSString * const NetWorkProductionDetail = @"remote/product?";
///商品参数及详情 4
NSString * const NetWorkProductionMoreDetails = @"remote/description?";
///商品评价 5
NSString * const NetWorkProductionComments = @"remote/comment?";
//提交订单接口
NSString * const NetWorkCreateOrder = @"remote/createOrder";
//订单支付成功之后回调
NSString * const NetWorkPayOrderSucc = @"remote/payOrder";

///收货地址添加 10
NSString * const NetWorkAddPostAddress = @"remote/addAddress";
///收货地址列表 11
NSString * const NetWorkPostAddressList = @"remote/addresses";
///删除收货地址 12
NSString * const NetWorkDeletePostAddress = @"remote/delAddress";
///编辑收货地址 12
NSString * const NetWorkEditPostAddress = @"remote/updateAddress";
///默认收货地址 13
NSString * const NetWorkDefaultPostAddress = @"remote/defaultAddress";


///用户个人信息 14
NSString * const NetWorkUserInfo = @"remote/userInfo";

///评论管理 19
NSString * const NetWorkAddComment = @"remote/addComment";

#pragma mark -- 订单
/**
 * 根据订单状态查看订单：
 * NOT_PAID("待支付"), PAID("待发货")RECEIVING("待收货"), FINISH("已完 成"),APPRAISING("待评价") 不传表示查询5种状态的商品
 **/
NSString * const NetWorkOrderList = @"remote/orderList";
///订单详情
NSString * const NetWorkOrderDetail = @"remote/detailsOrder";
///提醒发货
NSString * const NetWorkRemindPost = @"remote/remindShipments";
///确认收货
NSString * const NetWorkConfirmRecieve = @"remote/confirmDelivery";
///取消订单
NSString * const NetWorkCancelOrder = @"remote/cancelOrder";
///删除订单
NSString * const NetWorkDeleteOrder = @"remote/deleteOrder";

@implementation NetWorkConst

@end
