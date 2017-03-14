//
//  BlockActionButton.h
//  PioneerGathering
//
//  Created by reneboy on 16/11/10.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlockActionButton : UIView

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *bgColor;
@property (nonatomic, strong) UIColor *boderColor;
@property (nonatomic, assign) CGFloat boderWidth;
@property (nonatomic, assign) CGFloat cornerRadius;
/**
 *  显示的单边留白是margin的一半
 */
@property (nonatomic, assign) CGFloat horizonalMargin;
@property (nonatomic, assign) CGFloat verticalMargin;
/**
 *  点击回调事件
 */
@property (nonatomic, copy) void (^tapAction) (void);

@end
