//
//  MyKnowledgeStoreCell.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/11.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "MyKnowledgeStoreCell.h"

@interface MyKnowledgeStoreCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) UILabel *collectionLabel;
@property (nonatomic, strong) UIImageView *coverView;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation MyKnowledgeStoreCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpViews];
    }
    return self;
}

- (void)setUpViews {
    
    UIImageView *coverView = [[UIImageView alloc] init];
    //    coverView.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:coverView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.numberOfLines = 2;
    titleLabel.font = [UIFont systemFontOfSize:15*HEIGHT_SCALE];
    titleLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:titleLabel];
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteButton.titleLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
    [deleteButton setTitle:@"删除" forState:UIControlStateNormal];
    [deleteButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:deleteButton];
    
    UILabel *commentLabel = [[UILabel alloc] init];
    commentLabel.textAlignment = NSTextAlignmentCenter;
    commentLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
    commentLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:commentLabel];
    
    UILabel *collectionLabel = [[UILabel alloc] init];
    collectionLabel.textAlignment = NSTextAlignmentRight;
    collectionLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
    collectionLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:collectionLabel];
    
    //    self.bottomLineView.backgroundColor = [UIColor lightGrayColor];
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:bottomLine];
    
    self.coverView = coverView;
    self.titleLabel = titleLabel;
    self.deleteButton = deleteButton;
    self.commentLabel = commentLabel;
    self.collectionLabel = collectionLabel;
    self.bottomLine = bottomLine;
    
    self.hyb_lastViewInCell = self.bottomLineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        //导致计算高度出错的约束
        //        make.centerY.equalTo(self.contentView.mas_centerY);
        make.top.equalTo(self.contentView.mas_top).offset(10*HEIGHT_SCALE);
        make.right.equalTo(self.contentView.mas_right).offset(-15*WIDTH_SCALE);
        make.width.mas_equalTo(110*WIDTH_SCALE);
        make.height.mas_equalTo(80*WIDTH_SCALE);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverView.mas_top);
        make.left.equalTo(self.contentView.mas_left).offset(15*WIDTH_SCALE);
        make.right.equalTo(self.coverView.mas_left).offset(-15*WIDTH_SCALE);
    }];
    
    [self.collectionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.coverView.mas_bottom);
        make.right.equalTo(self.titleLabel.mas_right);
        make.width.mas_equalTo((MAINSCREEN_W-155*WIDTH_SCALE)/3);
    }];
    
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.width.equalTo(self.collectionLabel);
        make.right.equalTo(self.collectionLabel.mas_left);
    }];
    
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.commentLabel.mas_centerY);
        make.left.equalTo(self.contentView.mas_left);
        make.width.equalTo(self.commentLabel);
    }];
    
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.deleteButton.mas_bottom).offset(10*HEIGHT_SCALE);
        make.left.equalTo(self.contentView.mas_left);
        make.width.mas_equalTo(MAINSCREEN_W);
        make.height.mas_equalTo(1);
    }];
}

- (void)setModel:(KnowledgeStoreModel *)model {
    _model = model;
    [self.coverView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] placeholderImage:nil];
    self.titleLabel.text = model.title;
    self.commentLabel.text = model.comment;
    self.collectionLabel.text = model.collection;
}

- (void)deleteAction {
    if (self.deleteKnowledge) {
        self.deleteKnowledge(self.model);
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
