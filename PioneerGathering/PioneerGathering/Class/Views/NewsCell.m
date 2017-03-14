//
//  NewsCell.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/10.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "NewsCell.h"

@interface NewsCell ()

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIView *imagesView;

@property (nonatomic, strong) UILabel *descriptionLabel;

@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews {
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines = 0;
    titleLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
    [self.contentView addSubview:titleLabel];
    
    UIView *imagesView = [self buildImagesViewWithImages:self.model.imagesUrl];
    [self.contentView addSubview:imagesView];
    
    UILabel *descriptionLabel = [[UILabel alloc]init];
    descriptionLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
    descriptionLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:descriptionLabel];
    
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:bottomLine];
    
    self.titleLabel = titleLabel;
    self.imagesView = imagesView;
    self.descriptionLabel = descriptionLabel;
    self.bottomLine = bottomLine;
    
    self.hyb_lastViewInCell = self.bottomLine;
    self.hyb_bottomOffsetToCell = 0;
}

- (UIView *)buildImagesViewWithImages:(NSArray *)imagesArray {
    
    UIView *backView = [[UIView alloc] init];
    [self.contentView addSubview:backView];
    
    for (int i = 0; i < imagesArray.count; i++) {
        UIImageView *imgView = [[UIImageView alloc] init];
        [imgView sd_setImageWithURL:[NSURL URLWithString:imagesArray[i]] placeholderImage:nil];
        [backView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(backView);
            make.left.equalTo(backView.mas_left).offset(15 + ((MAINSCREEN_W-50)/3+10) * i);
            make.width.mas_equalTo((MAINSCREEN_W-50)/3);
        }];
    }
    
    return backView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(15*WIDTH_SCALE);
        make.left.equalTo(self.contentView.mas_left).offset(15*WIDTH_SCALE);
        make.right.equalTo(self.contentView.mas_right).offset(-15*WIDTH_SCALE);
    }];
    
    [self.imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15*WIDTH_SCALE);
        make.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(60);
    }];
    
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imagesView.mas_bottom).offset(15*WIDTH_SCALE);
        make.left.equalTo(self.contentView.mas_left).offset(15*WIDTH_SCALE);
    }];
    
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.descriptionLabel.mas_bottom).offset(10*WIDTH_SCALE);
        make.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(1);
    }];
}

- (void)setModel:(NewsModel *)model {
    
    self.titleLabel.text = model.title;
    self.imagesView = [self buildImagesViewWithImages:model.imagesUrl];
    self.descriptionLabel.text = [NSString stringWithFormat:@"%@·%@", model.time, model.comment];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
