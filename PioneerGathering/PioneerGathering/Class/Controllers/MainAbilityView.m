//
//  MainAbilityView.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/8.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "MainAbilityView.h"

#import "GQSTextAndImageView.h"

@interface MainAbilityView ()

@property (nonatomic, strong) GQSTextAndImageView *textAndImageView;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIButton *clickButton;

@end

@implementation MainAbilityView

- (instancetype)initWithFrame:(CGRect)frame
                    mainTitle:(NSString *)mainTitle
                     textIcon:(UIImage *)textIcon
                  describText:(NSString *)describText
                     mainIcon:(UIImage *)mainIcon {
    
    if (self = [super init]) {
        [self setUpViewsWithMainTitle:mainTitle textIcon:textIcon describText:describText mainIcon:mainIcon];
    }
    return self;
}

- (void)setUpViewsWithMainTitle:(NSString *)mainTitle
                       textIcon:(UIImage *)textIcon
                    describText:(NSString *)describText
                       mainIcon:(UIImage *)mainIcon {
    
    _textAndImageView = [[GQSTextAndImageView alloc] initWithFrame:CGRectZero Image:textIcon Text:mainTitle andExhibitDirection:GQSTextLeftImageRight isButton:NO];
    _textAndImageView.imageSize = CGSizeMake(15, 15);
    _textAndImageView.padding = 10;
    _textAndImageView.textColor = [UIColor grayColor];
    _textAndImageView.textFont = [UIFont systemFontOfSize:15];
    [self addSubview:_textAndImageView];
    
    UILabel *descriptionLabel = [[UILabel alloc] init];
    descriptionLabel.numberOfLines = 0;
    descriptionLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
    descriptionLabel.textColor = [UIColor grayColor];
    descriptionLabel.text = describText;
    [self addSubview:descriptionLabel];
    self.descriptionLabel = descriptionLabel;
    
    UIImageView *iconView = [[UIImageView alloc] init];
    iconView.image = mainIcon;
    [self addSubview:iconView];
    self.iconView = iconView;
    
    UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    clickButton.backgroundColor = [UIColor clearColor];
    [clickButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:clickButton];
    self.clickButton = clickButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.textAndImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(20*HEIGHT_SCALE);
        make.left.equalTo(self.mas_left).offset(30*WIDTH_SCALE);
    }];
    
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textAndImageView.mas_bottom).offset(20*HEIGHT_SCALE);
        make.right.equalTo(self.mas_centerX).offset(-15*WIDTH_SCALE);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.descriptionLabel.mas_bottom);
        make.right.equalTo(self.mas_right).offset(-15*WIDTH_SCALE);
    }];
    
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self);
    }];
}

- (void)click {
    if (self.jumpToController) {
        self.jumpToController();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
