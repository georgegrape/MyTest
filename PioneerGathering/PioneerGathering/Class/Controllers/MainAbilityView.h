//
//  MainAbilityView.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/8.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainAbilityView : UIView

@property (nonatomic, copy) void (^jumpToController) (void);

- (instancetype)initWithFrame:(CGRect)frame
                    mainTitle:(NSString *)mainTitle
                     textIcon:(UIImage *)textIcon
                  describText:(NSString *)describText
                     mainIcon:(UIImage *)mainIcon;

@end
