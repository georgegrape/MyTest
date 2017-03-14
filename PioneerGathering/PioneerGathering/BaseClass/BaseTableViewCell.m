//
//  BaseTableViewCell.m
//  ZhongYiEld
//
//  Created by reneboy on 16/4/13.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = [[UIScreen mainScreen] applicationFrame];
        // Initialization code
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_bottomLineView];
        
        _topLineView = [[UIView alloc] init];
        _topLineView.backgroundColor = [UIColor grayColor];
        [self.contentView addSubview:_topLineView];
    }
    return self;
}



@end
