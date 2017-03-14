//
//  PioneerGatheringDefine.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/8.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#ifndef PioneerGatheringDefine_h
#define PioneerGatheringDefine_h

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define WEAKSELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;
/**
 * 请求成功判断
 */
#define REQUESTSUCCESS [json[@"code"] isEqualToString:@"1"]

// 热线电话号码
#define HOT_LINE @"400-000-0000"

/**
 * 获取json中data数据
 */
#define JSONDATA json[@"data"]

/**
 * 一天时间转换秒数
 */
#define TOTAL_SECONDS 3600*24

/**
 * 占位图
 */
#define DEFAULT_AVATAR [UIImage imageNamed:@"default_avatar"]
#define PLACEHOLDER_IMAGE [UIImage imageNamed:@"placeholder_image"]
#define NEWS_PLACEHOLDER [UIImage imageNamed:@"news_placeholder"]
#define PRODUCTION_PLACEHOLDER [UIImage imageNamed:@"production_placeholder"]

/**
 * 默认收货地址存储所用Key
 */
#define DEFAULT_ADDRESS_KEY @"default_address"


/**
 * 屏幕尺寸
 */
#define MAINSCREEN_H [UIScreen mainScreen].bounds.size.height
#define MAINSCREEN_W [UIScreen mainScreen].bounds.size.width

#define WIDTH_SCALE  [UIScreen mainScreen].bounds.size.width/375
#define HEIGHT_SCALE [UIScreen mainScreen].bounds.size.height/667


/**
 * 各种形式颜色的转换
 */
#define UIColorFromRGB(r, g, b) RGBACOLOR(r, g, b, 1.0)
#define UIColorFromRGBA(r, g, b, a) RGBACOLOR(r, g, b, a)
#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define UIColorFromHex(hex) UIColorFromHexA(hex, 1.0)
#define UIColorFromHexA(hex, a) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:a]


/**
 * 各种系统控件的高度
 */
#define TAB_BAR_HEIGHT self.tabBarController.tabBar.frame.size.height
#define NAVIGATION_BAR_HEIGHT self.navigationController.navigationBar.frame.size.height
#define STATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
#define STATUS_NAVIGATION_BAR_HEIGH (STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT)
#define STATUS_NAVIGATION_TAB_BAR_HEIGH (STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT + TAB_BAR_HEIGHT)

/**
 * 主要的几种颜色
 */
#define ZY_STATUS_BG_COLOR UIColorFromHex(0xa1adcb)
#define ZY_STATUS_TEXT_COLOR UIColorFromHex(0xffffff)
#define ZY_NAVIGATION_BG_COLOR UIColorFromHex(0xa1adcb)
#define ZY_NAVIGATION_TEXT_COLOR UIColorFromHex(0x333333)
#define ZY_BGCOLOR UIColorFromHex(0xeff1f2)
#define ZY_SEPERATE_LINE_COLOR UIColorFromHex(0xf2f2f2)
#define ZY_ALARM_SEPARATOR_COLOR RGBACOLOR(218, 217, 221, 1.0)
#define ZY_BUTTON_BG_COLOR UIColorFromHex(0x089f28)
#define ZY_DEFAULT_TEXT_COLOR UIColorFromHex(0x333333)
#define ZY_TIPS_TEXT_COLOR UIColorFromHex(0x666666)
#define ZY_IMAGE_BORDER_COLOR UIColorFromHex(0x999999)
#define ZY_REDBUTTONCOLOR UIColorFromHex(0xd42428)
#define ZY_SHWDOWGRAY UIColorFromHex(0xf6f6f6)

/**
 * 设置图片的宏定义
 */
#define ZY_SetNormalImage(imageView, path) [imageView sd_setImageWithURL:AVATAR_ABS_PATH(path).URL placeholderImage:[UIImage imageNamed:@"default_photo"]]

#endif /* PioneerGatheringDefine_h */
