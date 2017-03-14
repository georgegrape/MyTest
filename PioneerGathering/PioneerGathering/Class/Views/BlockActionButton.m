//
//  BlockActionButton.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/10.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "BlockActionButton.h"

@interface BlockActionButton ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation BlockActionButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews {
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    [self addSubview:label];
    self.titleLabel = label;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tap];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
    }];
}

- (void)tap {
    if (self.tapAction) {
        self.tapAction();
    }
}

- (void)setText:(NSString *)text {
    self.titleLabel.text = text;
}
- (void)setFont:(UIFont *)font {
    self.titleLabel.font = font;
}
- (void)setTextColor:(UIColor *)textColor  {
    self.titleLabel.textColor = textColor;
}
- (void)setBgColor:(UIColor *)bgColor {
    if (bgColor == nil) {
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = bgColor;
    }
}
- (void)setBoderColor:(UIColor *)boderColor {
    self.layer.borderColor = boderColor.CGColor;
}
- (void)setBoderWidth:(CGFloat)boderWidth {
    self.layer.borderWidth = boderWidth;
}
- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}
- (void)setHorizonalMargin:(CGFloat)horizonalMargin {
    _horizonalMargin = horizonalMargin;
}
- (void)setVerticalMargin:(CGFloat)verticalMargin {
    _verticalMargin = verticalMargin;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
