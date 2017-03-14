//
//  BaseTableViewCell.h
//  ZhongYiEld
//
//  Created by reneboy on 16/4/13.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic, strong) UIView *topLineView;

@property (nonatomic, strong) UIView *bottomLineView;

@property (nonatomic, strong) NSIndexPath *indexPath;

@end
