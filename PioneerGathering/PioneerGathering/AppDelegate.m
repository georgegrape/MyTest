//
//  AppDelegate.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "AppDelegate.h"
#import "PioneerGatheringTabBarController.h"
#import "PioneerGatheringNavigationController.h"

AppDelegate * appdel;
@interface AppDelegate ()

@property (nonatomic, strong)PioneerGatheringTabBarController *pgTabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    appdel = self;
    
    _pgTabBarController = [[PioneerGatheringTabBarController alloc] init];
    UINavigationController *nav = [[PioneerGatheringNavigationController alloc] initWithRootViewController:_pgTabBarController];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark - MBProgressHUD

/**
 *  显示提示层
 */
- (void)showHudwithTitle:(NSString *)title detail:(NSString *)detail
{
    [self clearVisibleHUD];
    [self showHudwithTitle:title detail:detail yOffSet:0];
}

- (void)showHudwithTitle:(NSString *)title detail:(NSString *)detail yOffSet:(CGFloat)offset
{
    [self clearVisibleHUD];
    MBProgressHUD *mb = [MBProgressHUD showHUDAddedTo:self.window animated:NO];
    mb.mode = MBProgressHUDModeText;
    mb.yOffset = offset;
    mb.userInteractionEnabled = NO;
    mb.removeFromSuperViewOnHide = YES;
    mb.labelText = title;
    mb.detailsLabelText = detail;
    [mb show:YES];
    [mb hide:YES afterDelay:2.0f];
}


////显示加载圈
- (void)showUpLoadingMessage
{
    [self clearVisibleHUD];
    MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:self.window animated:NO];
    mbp.labelText = nil;
    mbp.labelText = @"   数据上传中...   ";
}

- (void)showLoadingMessage
{
    [self clearVisibleHUD];
    MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:self.window animated:NO];
    mbp.userInteractionEnabled = NO;
    mbp.labelText = nil;
}

- (void)showLoadingHUDWithMessage:(NSString *)message {
    [self clearVisibleHUD];
    MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:self.window animated:NO];
    mbp.userInteractionEnabled = NO;
    mbp.labelText = message;
}

- (void)showLoadingHUDWithMessage:(NSString *)message
           userInteractionEnabled:(BOOL)userInteractionEnabled {
    [self clearVisibleHUD];
    MBProgressHUD *mbp = [MBProgressHUD showHUDAddedTo:self.window animated:NO];
    mbp.userInteractionEnabled = userInteractionEnabled;
    mbp.labelText = message;
}

//隐藏加载圈
- (void)hideLoadingMessage
{
    [MBProgressHUD hideHUDForView:self.window animated:NO];
}

/**
 *  当有新的提示弹出，旧的提示移除
 */
- (void)clearVisibleHUD {
    for (id view in self.window.subviews) {
        if ([view isKindOfClass:[MBProgressHUD class]]) {
            [view removeFromSuperview];
        }
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
