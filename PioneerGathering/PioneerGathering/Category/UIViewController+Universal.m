//
//  UIViewController+Universal.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/7.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "UIViewController+Universal.h"
#import "UIColor+ColorExtension.h"
#import "Util.h"
#define TEXT_COLOR RGBACOLOR(255, 90, 95, 1)

@implementation UIViewController (Universal)

- (void)setLeftBackBarButtonItem:(SEL)action {
    self.navigationItem.leftBarButtonItem = nil;
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 8, 15)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
    
    if (action) {
        [leftButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    } else {
        [leftButton addTarget:self action:@selector(defaultBackAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setLeftBackLightBarButtonItem:(SEL)action {
    self.navigationItem.leftBarButtonItem = nil;
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"btn_back_light"] forState:UIControlStateNormal];
    
    if (action) {
        [leftButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    } else {
        [leftButton addTarget:self action:@selector(defaultBackAction) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)setLeftText:(NSString *)text barButtonItem:(SEL)action {
    self.navigationItem.leftBarButtonItem = nil;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 44, 22);
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    if (action) {
        [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItems = @[[self spaceButtonItem], leftItem];
}

- (void)setRightText:(NSString *)text barButtonItem:(SEL)action {
    self.navigationItem.rightBarButtonItem = nil;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(0, 0, 50, 22);
    rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightButton setTitle:text forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor colorWithHex:RGBDarkColor] forState:UIControlStateNormal];
    if (action) {
        [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItems = @[[self spaceTextButtonItem], rightItem];
}

- (void)setMainRightText:(NSString *)text barButtonItem:(SEL)action {
    self.navigationItem.rightBarButtonItem = nil;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 60, 22);

//    UILabel *rightLabel = [[UILabel alloc] init];
//    rightLabel.clipsToBounds = YES;
//    rightLabel.userInteractionEnabled = YES;
//    rightLabel.font = [UIFont systemFontOfSize:10];
//    rightLabel.textColor = FP_NAVIGATION_TEXT_COLOR;
//    if (text == nil) {
//        rightLabel.text = @"登录";
//        rightButton.userInteractionEnabled = YES;
//    } else {
//        rightLabel.text = text;
//        rightButton.userInteractionEnabled = NO;
//    }
    
//    [rightButton addSubview:rightLabel];
//    [rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(rightButton.mas_right).offset(-10);
//        make.centerY.equalTo(rightButton.mas_centerY);
//    }];
    [rightButton setTitle:text forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:10];
    
    if (action) {
        [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(action)];
//        [rightLabel addGestureRecognizer:tap];
    }
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItems = @[[self spaceTextButtonItem], rightItem];
}

- (void)setRightImage:(NSString *)imageName barButtonItem:(SEL)action {
    self.navigationItem.rightBarButtonItem = nil;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 44, 22);
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (action) {
        [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItems = @[[self spaceButtonItemWithImage], rightItem];
}

- (void)setRightDeleteBarButtonItem:(SEL)action {
    self.navigationItem.rightBarButtonItem = nil;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(0, 0, 18, 20);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"nav_delete_button"] forState:UIControlStateNormal];
    if (action) {
        [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)setRightMenuBarButtonItem:(SEL)action {
    self.navigationItem.rightBarButtonItem = nil;
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.frame = CGRectMake(0, 0, 20, 5);
    [rightButton setBackgroundImage:[UIImage imageNamed:@"nav_menu_button"] forState:UIControlStateNormal];
    if (action) {
        [rightButton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
}

/**
 *  新样式  导航栏 右边按钮
 */
- (void)setRightCommonBarButtonItem:(SEL)action title:(NSString *)title {
    self.navigationItem.rightBarButtonItem = nil;
    UIButton *button = [[UIButton alloc] init];
    button.layer.cornerRadius = 4;
    button.clipsToBounds = YES;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:RGBACOLOR(255, 255, 255, 1) forState:UIControlStateNormal];
    [button setBackgroundImage:[Util createImageWithColor:RGBACOLOR(255, 90, 95, 1)] forState:UIControlStateNormal];
    [button setBackgroundImage:[Util createImageWithColor:RGBACOLOR(220, 48, 54, 1)] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 52, 25);
    if (action) {
        [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    [button setTitle:title forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)setLeftText:(NSString *)text tabBarButtonItem:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 44, 22);
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:TEXT_COLOR forState:UIControlStateNormal];
    if (action) {
        [button addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.tabBarController.navigationItem.leftBarButtonItems = @[[self spaceButtonItem], leftItem];
}

//- (void)showAppRateView {
//    if ([UserDefaultsUtil isNeverShowAppRateView]) return;
//    
//    NSInteger appOpenedTimes = [[NSUserDefaults standardUserDefaults] integerForKey:ApplicationOpendedTimes];
//    if (appOpenedTimes == 0 || (appOpenedTimes % 15) != 0) return;
//    
//    [WCAlertView showAlertWithTitle:@"我要好评，我不管！"
//                            message:@"你已经用DoubleDate一段时间了，既然我这么棒，就去给我个好评吧！"
//                 customizationBlock:nil
//                    completionBlock:^(NSUInteger buttonIndex, WCAlertView *alertView) {
//        if (buttonIndex == 0) {
//            [Util goToAppStore];
//        } else if (buttonIndex == 1) {
//            ChatViewController *chatVC = [[ChatViewController alloc] initWithChatter:FEEDBACK isGroup:NO];
//            chatVC.title = @"吐槽冲我来";
//            [self.navigationController pushViewController:chatVC animated:YES];
//        } else if (buttonIndex == 3) {
//            [UserDefaultsUtil saveNeverShowAppRateView];
//        }
//    } cancelButtonTitle:nil otherButtonTitles:@"善良的答应你", @"哼，我要吐槽", @"以后再说", @"no, 我不要", nil];
//}

#pragma mark - Action
- (void)defaultBackAction {
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Private
- (UIBarButtonItem *)spaceButtonItem {
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                           target:nil
                                                                           action:nil];
    
    space.width = -20;
    return space;
}

- (UIBarButtonItem *)spaceTextButtonItem {
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                           target:nil
                                                                           action:nil];
    
    space.width = -10;
    return space;
}

- (UIBarButtonItem *)spaceButtonItemWithImage {
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                                                           target:nil
                                                                           action:nil];
    
    space.width = -10;
    return space;
}
@end
