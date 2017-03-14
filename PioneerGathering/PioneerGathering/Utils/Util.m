//
//  Util.m
//  HotelBook
//
//  Created by reneboy on 16/7/1.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "Util.h"

@implementation Util

+ (UIImage *)createImageWithColor:(UIColor*)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (NSMutableAttributedString *)setWholeText:(NSString *)text
                            changeColorText:(NSString *)colorText
                                  withColor:(UIColor *)color {
    NSString *temp = nil;
    NSMutableAttributedString *strs;
    @autoreleasepool {
        for(int i =0; i < [text length]; i++)
        {
            temp = [text substringWithRange:NSMakeRange(i, 1)];
            if([colorText containsString:temp])
            {
                strs = [[NSMutableAttributedString alloc] initWithString:text];
                [strs addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(i,[colorText length])];
                
                break;
            }
        }
    }
    return strs;
}

+ (NSString *)weekOfDate:(NSString *)theDate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd 00:00:00"];
    NSDate *date = [formatter dateFromString:theDate];
    NSCalendar *myCalendar = [NSCalendar currentCalendar];
    myCalendar.timeZone = [NSTimeZone systemTimeZone];
    NSInteger week = [[myCalendar components:NSCalendarUnitWeekday fromDate:date] weekday];
    switch (week) {
        case 1:
        {
            return @"周日";
        }
            
        case 2:
        {
            return @"周一";
        }
            
        case 3:
        {
            return @"周二";
        }
            
        case 4:
        {
            return @"周三";
        }
            
        case 5:
        {
            return @"周四";
        }
            
        case 6:
        {
            return @"周五";
        }
            
        case 7:
        {
            return @"周六";
        }
    }
    
    return @"";
    
}

+ (NSDate *)getNowDateFormatAnDate:(NSDate *)anyDate

{
    
    //设置源日期时区
    
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    
    //设置转换后的目标日期时区
    
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    
    //得到源日期与世界标准时间的偏移量
    
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    
    //目标日期与本地时区的偏移量
    
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    
    //得到时间偏移量的差值
    
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    
    //转为现在时间
    
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    
    return destinationDateNow;
    
}

+ (NSMutableAttributedString*) changeLabelWithText:(NSString*)needText
                                        frontColor:(UIColor *)frontColor
                                         frontFont:(UIFont *)frontFont
                                       behindColor:(UIColor *)behindeColor
                                        behindFont:(UIFont *)behindFont
                                       frontRange:(NSRange)frontRange
                                       behindRange:(NSRange)behindRange
{
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:needText];
    
    [attrString addAttribute:NSFontAttributeName value:frontFont range:frontRange];
    [attrString addAttribute:NSForegroundColorAttributeName value:frontColor range:frontRange];
    
    
    [attrString addAttribute:NSFontAttributeName value:behindFont range:behindRange];
    [attrString addAttribute:NSForegroundColorAttributeName value:behindeColor range:behindRange];
    
    return attrString;
}

+ (NSString *)GetTomorrowDay:(NSDate *)aDate
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:aDate];
    [components setDay:([components day]+1)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
    [dateday setDateFormat:@"yyyy-M-d"];
    return [dateday stringFromDate:beginningOfWeek];
}

//设置不同字体颜色
+ (void)setLabel:(UILabel *)label withFont:(UIFont *)font color:(UIColor *)color range:(NSRange)range {
    
    NSMutableAttributedString *str = nil;
    if (label.attributedText) {
        str = [[NSMutableAttributedString alloc] initWithAttributedString:label.attributedText];
    } else {
        str = [[NSMutableAttributedString alloc] initWithString:label.text];
    }
    
    //设置字号
    [str addAttribute:NSFontAttributeName value:font range:range];
    
    //设置文字颜色
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    
    label.attributedText = str;
}

@end
