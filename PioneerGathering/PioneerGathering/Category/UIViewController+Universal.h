//
//  UIViewController+Universal.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface UIViewController (Universal)

- (void)setLeftBackBarButtonItem:(SEL)action;

- (void)setLeftBackLightBarButtonItem:(SEL)action;

- (void)setLeftText:(NSString *)text barButtonItem:(SEL)action;

- (void)setRightText:(NSString *)text barButtonItem:(SEL)action;

- (void)setMainRightText:(NSString *)text barButtonItem:(SEL)action;

- (void)setRightImage:(NSString *)imageName barButtonItem:(SEL)action;

- (void)setRightDeleteBarButtonItem:(SEL)action;

- (void)setRightMenuBarButtonItem:(SEL)action;

- (void)setLeftText:(NSString *)text tabBarButtonItem:(SEL)action;

/**
 *  新样式  导航栏 右边按钮
 */
- (void)setRightCommonBarButtonItem:(SEL)action title:(NSString *)title;

//- (void)showAppRateView;
@end
