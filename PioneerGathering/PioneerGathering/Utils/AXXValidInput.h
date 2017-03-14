//
//  AXXValidInput.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AXXValidInput : NSObject

+ (BOOL)isPassword:(NSString *)password;
+ (BOOL)isMobile:(NSString *)mobile;

+ (void)settimer:(UIButton *)timerbtn;

@end
