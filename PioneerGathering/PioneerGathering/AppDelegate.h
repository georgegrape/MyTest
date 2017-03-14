//
//  AppDelegate.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (void)showHudwithTitle:(NSString *)title detail:(NSString *)detail;
- (void)showHudwithTitle:(NSString *)title detail:(NSString *)detail yOffSet:(CGFloat)offset;
- (void)showLoadingMessage;
- (void)hideLoadingMessage;
- (void)showLoadingHUDWithMessage:(NSString *)message;
- (void)showLoadingHUDWithMessage:(NSString *)message userInteractionEnabled:(BOOL)userInteractionEnabled;

@end

extern AppDelegate *appdel;