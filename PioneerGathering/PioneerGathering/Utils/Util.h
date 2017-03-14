//
//  Util.h
//  HotelBook
//
//  Created by reneboy on 16/7/1.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Util : NSObject

+ (UIImage *)createImageWithColor:(UIColor*)color;

// 改变所传字符串指定位置颜色
+ (NSMutableAttributedString *)setWholeText:(NSString *)text
                            changeColorText:(NSString *)colorText
                                  withColor:(UIColor *)color;

///传入日期字符串返回星期
+ (NSString *)weekOfDate:(NSString *)theDate;

///传入日期转换成当前时区日期
+ (NSDate *)getNowDateFormatAnDate:(NSDate *)anyDate;

///分段改变字体颜色字号
+ (NSMutableAttributedString*) changeLabelWithText:(NSString*)needText
                                        frontColor:(UIColor *)frontColor
                                         frontFont:(UIFont *)frontFont
                                       behindColor:(UIColor *)behindeColor
                                        behindFont:(UIFont *)behindFont
                                        frontRange:(NSRange)frontRange
                                       behindRange:(NSRange)behindRange;

+ (NSString *)GetTomorrowDay:(NSDate *)aDate;

+ (void)setLabel:(UILabel *)label withFont:(UIFont *)font color:(UIColor *)color range:(NSRange)range;

@end
