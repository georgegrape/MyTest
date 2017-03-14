//
//  UITabBar+badge.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (badge)
//显示小红点
- (void)showBadgeOnItemIndex:(int)index;
//隐藏小红点
- (void)hideBadgeOnItemIndex:(int)index;

@end
