//
//  DataManager.h
//  ZhongYiEld
//
//  Created by reneboy on 16/4/12.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#define isPortraitPad ([[UIApplication sharedApplication] statusBarOrientation]== UIDeviceOrientationPortrait||[[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationPortraitUpsideDown)
//横屏
#define isLandscapePad ([[UIApplication sharedApplication] statusBarOrientation]==UIDeviceOrientationLandscapeLeft|| [[UIApplication sharedApplication] statusBarOrientation] == UIDeviceOrientationLandscapeRight)

#define MAIN_SCREEN_WIDTH (isPortraitPad ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)

#define MAIN_SCREEN_HEIGHT (isPortraitPad ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)

#define ZOOM(length) (length)*((isPortraitPad ? MAIN_SCREEN_WIDTH : MAIN_SCREEN_HEIGHT)) /320.0

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;



#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
//#import "MyPharmacyModel.h"
//#import "Config.h"
//#import "CYLHttpRequest.h"
//#import "NSArray+PPCategory.h"
@interface DataManager : NSObject

@property (strong, nonatomic) NSString *host;
@property (strong, nonatomic) NSString *hostURL;
//@property (readwrite) int maxDownloadOperationCount;
@property (readonly, nonatomic) BOOL isLogin;
@property (strong, nonatomic) UserInfoModel *userInfo;
//
//
+ (DataManager *)sharedManager;
//
- (NSURL *)appendHTMLURL:(NSURL *)url;
- (void)getUserMessage:(NSDictionary *)userDic;
- (void)getUserMessageFromUserDefaults;
- (void)clearUserMessage;
- (BOOL)hadLogedIn;
- (void)changeUserAvatar:(NSString *)photoName;
- (void)recordLoginState:(BOOL)loginState;
- (UserInfoModel *)getUserInfo;
//
//- (void)setPharmacyMessage:(NSDictionary *)userDic;
//- (void)getPharmacyMessageFromUserDefaults;
//- (void)clearPharmacyMessage;
//- (MyPharmacyModel *)getPharmacyInfo;

@end
