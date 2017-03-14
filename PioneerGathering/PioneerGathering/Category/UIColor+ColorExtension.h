//
//  UIColor+ColorExtension.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DefaultFontName @"STHeitiSC-Light"
#define UIColorFromRGB(rgbValue)        [UIColor             \
colorWithRed: ((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green: ((float)((rgbValue & 0xFF00) >> 8)) / 255.0           \
blue: ((float)(rgbValue & 0xFF)) / 255.0 alpha : 1.0]

#define UIColorFromRGBValue(r, g, b)    [UIColor \
colorWithRed : ((float)(r)) / 255.0      \
green : ((float)(g)) / 255.0             \
blue : ((float)(b)) / 255.0 alpha : 1.0]

#define RGBACOLOR(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
/// 主色
extern const unsigned int RGBMainColor;
/// 背景色
extern const unsigned int RGBBackgroundColor;
extern const unsigned int RGBRedColor;
//粉色
extern const unsigned int RGBPinkColor;
extern const unsigned int RGBDarkColor;
extern const unsigned int RGBLogoPinkColor;
extern const unsigned int RGBLogoBlueColor;
extern const unsigned int RGBLogoPurpleColor;

///// 分割线
//extern const unsigned int RGBSeparatorColor;
/////
//extern const unsigned int RGBContentTextColor;
//
//extern const unsigned int RGBShallowTextColor;
//
//extern const unsigned int RGBShallowRedColor;

///// 导航标题颜色
//extern const unsigned int RGBNaviextColor;
///// 文本橘色
//extern const unsigned int RGBOrangeTextColor;
///// 文本详情颜色
//extern const unsigned int RGBContentTextColor;
///// 文本蓝色
//extern const unsigned int RGBBlueTextColor;
///// 文本金色
//extern const unsigned int RGBGoldenTextColor;
///// 文本灰
//extern const unsigned int RGBGrayTextColor;


/// 导航文字大小
extern const int FontSizeNaviTitle;
//按钮文字
extern const int FontSizeButtonTitle;
/// 备注文字
extern const int FontSizeNote;


@interface UIColor (ColorExtension)

+ (UIColor *) colorWithHexString:(NSString *)stringToConvert;

+ (id) colorWithHex:(unsigned int)hex;
+ (id) colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha;

+ (id) randomColor;

@end
