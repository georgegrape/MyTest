//
//  PioneerGatheringNavigationController.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/8.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "PioneerGatheringNavigationController.h"

@interface PioneerGatheringNavigationController ()

@end

@implementation PioneerGatheringNavigationController

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.navigationBar.barTintColor = RGBACOLOR(251, 251, 251, 1);
    //	self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationBar.translucent = NO;
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:RGBACOLOR(103, 103, 103, 1), NSForegroundColorAttributeName, [UIFont systemFontOfSize:18.0], NSFontAttributeName, nil];
    self.navigationBar.titleTextAttributes = dic;
}

@end
