//
//  BusinessSchoolCell.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/9.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "BusinessOrMeditationCell.h"

#import "GQSTextAndImageView.h"

@interface BusinessOrMeditationCell ()

@property (nonatomic, strong) UIView *titleView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *avatarView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *bigVIcon;

@property (nonatomic, strong) UILabel *dutyLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UIImageView *divideLine;

@property (nonatomic, strong) GQSTextAndImageView *dateView;

@property (nonatomic, strong) GQSTextAndImageView *addressView;

@end

@implementation BusinessOrMeditationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews {
    
    [self.contentView addSubview:self.titleView];;
    
    UIImageView *avatarView = [[UIImageView alloc] init];
    [self.contentView addSubview:avatarView];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
    nameLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:nameLabel];
    
    UIImageView *bigVIcon = [[UIImageView alloc] init];
    bigVIcon.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:bigVIcon];
    
    UILabel *dutyLabel = [[UILabel alloc] init];
    dutyLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
    dutyLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:dutyLabel];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.font = [UIFont systemFontOfSize:12*HEIGHT_SCALE];
    priceLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:priceLabel];
    
    UIImageView *divideLine = [[UIImageView alloc] init];
    divideLine.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:divideLine];
    
    GQSTextAndImageView *dateView = [[GQSTextAndImageView alloc] initWithFrame:CGRectZero Image:[UIImage imageNamed:@"textIcon"] Text:nil andExhibitDirection:GQSTextRightImageLeft isButton:NO];
    dateView.textFont = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
    dateView.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:dateView];
    
    GQSTextAndImageView *addressView = [[GQSTextAndImageView alloc] initWithFrame:CGRectZero Image:[UIImage imageNamed:@"textIcon"] Text:nil andExhibitDirection:GQSTextRightImageLeft isButton:NO];
    addressView.textFont = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
    addressView.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:addressView];
    
//    self.titleView = titleView;
    self.avatarView = avatarView;
    self.nameLabel = nameLabel;
    self.bigVIcon = bigVIcon;
    self.dutyLabel = dutyLabel;
    self.priceLabel = priceLabel;
    self.divideLine = divideLine;
    self.dateView = dateView;
    self.addressView = addressView;
    
    self.hyb_lastViewInCell = self.addressView;
    self.hyb_bottomOffsetToCell = 10;
    
    self.topLineView.hidden = YES;
    self.bottomLineView.hidden = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.width.mas_equalTo(MAINSCREEN_W);
        make.height.mas_equalTo(30);
    }];
    
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10*WIDTH_SCALE);
        
        ///
        make.width.height.mas_equalTo(40*WIDTH_SCALE);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarView.mas_top);
        make.left.equalTo(self.avatarView.mas_right).offset(5);
    }];
    
    [self.dutyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.avatarView.mas_bottom);
        make.left.equalTo(self.avatarView.mas_right).offset(5);
    }];
    
    [self.bigVIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.dutyLabel.mas_centerY);
        make.left.equalTo(self.dutyLabel.mas_right).offset(5*WIDTH_SCALE);
        
        //
        make.width.height.mas_equalTo(15);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.avatarView.mas_bottom);
        make.right.equalTo(self.contentView.mas_right).offset(-20*WIDTH_SCALE);
    }];
    
    [self.divideLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarView.mas_bottom).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(10*WIDTH_SCALE);
        make.right.equalTo(self.contentView.mas_right).offset(-10*WIDTH_SCALE);
        make.height.mas_equalTo(1);
    }];
    
    [self.dateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.divideLine.mas_bottom).offset(10);
        make.left.equalTo(self.contentView.mas_left).offset(10*WIDTH_SCALE);
    }];
    
    [self.addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dateView.mas_bottom).offset(5);
        make.left.equalTo(self.contentView.mas_left).offset(10*WIDTH_SCALE);
    }];
}

- (UIView *)titleView {
    
    if (!_titleView) {
        UIView *backView = [[UIView alloc] init];
        backView.backgroundColor = RGBACOLOR(204, 204, 204, 1);
        _titleView = backView;
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
        titleLabel.textColor = [UIColor blackColor];
        [backView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(backView.mas_centerY);
            make.left.equalTo(backView.mas_left).offset(20*WIDTH_SCALE);
            make.width.mas_equalTo(MAINSCREEN_W-20*WIDTH_SCALE);
        }];
    }
    
    
    return _titleView;
}

- (void)setModel:(BusinessOrMeditaitionModel *)model {
    self.titleLabel.text = model.title;
    [self.avatarView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:[UIImage imageNamed:@"default"]];
    self.nameLabel.text = model.name;
    self.dutyLabel.text = model.duty;
    self.priceLabel.text = [NSString stringWithFormat:@"￥ %.2f", [model.price floatValue]];
    self.dateView.titleText = model.date;
    self.addressView.titleText = model.position;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
