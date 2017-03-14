//
//  MyInformationCell.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/11.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "MyInformationCell.h"

@interface MyInformationCell ()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *arrowIcon;

@end

@implementation MyInformationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews {
    UIImageView *iconView = [[UIImageView alloc] init];
    [self.contentView addSubview:iconView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:14*HEIGHT_SCALE];
    [self.contentView addSubview:titleLabel];
    
    UIImageView *arrowIcon = [[UIImageView alloc] init];
    arrowIcon.image = [UIImage imageNamed:@"back_button"];
    [self.contentView addSubview:arrowIcon];
    
    self.iconView = iconView;
    self.titleLabel = titleLabel;
    self.arrowIcon = arrowIcon;
    self.bottomLineView.backgroundColor = RGBACOLOR(204, 204, 204, 1);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(10*WIDTH_SCALE);
        
        //
        make.width.height.mas_equalTo(15*WIDTH_SCALE);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.iconView.mas_right).offset(15*WIDTH_SCALE);
    }];
    
    [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-10*WIDTH_SCALE);
    }];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.left.equalTo(self.contentView.mas_left).offset(10*WIDTH_SCALE);
        make.right.equalTo(self.contentView.mas_right).offset(-10*WIDTH_SCALE);
        make.height.mas_equalTo(1);
    }];
}

- (void)setIconImage:(UIImage *)iconImage {
    self.iconView.image = iconImage;
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
