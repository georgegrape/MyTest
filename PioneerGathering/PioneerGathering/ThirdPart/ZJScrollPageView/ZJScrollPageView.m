//
//  ZJScrollPageView.m
//  ZJScrollPageView
//
//  Created by jasnig on 16/5/6.
//  Copyright © 2016年 ZeroJ. All rights reserved.
//

#import "ZJScrollPageView.h"

@interface ZJScrollPageView ()
@property (strong, nonatomic) ZJSegmentStyle *segmentStyle;
@property (weak, nonatomic) ZJScrollSegmentView *segmentView;
@property (weak, nonatomic) ZJContentView *contentView;

@property (weak, nonatomic) UIViewController *parentViewController;
@property (strong, nonatomic) NSArray *childVcs;
@property (strong, nonatomic) NSArray *titlesArray;

@end
@implementation ZJScrollPageView

#pragma mark - life cycle

- (instancetype)initWithFrame:(CGRect)frame segmentStyle:(ZJSegmentStyle *)segmentStyle childVcs:(NSArray *)childVcs parentViewController:(UIViewController *)parentViewController {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        self.childVcs = childVcs;
        self.segmentStyle = segmentStyle;
        self.parentViewController = parentViewController;
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
 
    NSMutableArray *tempTitles = [NSMutableArray array];
    for (UIViewController *childVc in self.childVcs) {
        NSAssert(childVc.title, @"子控制器的title没有正确设置!!");
        if (childVc.title) {
            [tempTitles addObject:childVc.title];
        }
    }
    
    self.titlesArray = [NSArray arrayWithArray:tempTitles];
    
    // 触发懒加载
    self.segmentView.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
}

- (void)dealloc {
    NSLog(@"ZJScrollPageView--销毁");
}

#pragma mark - public helper

/** 给外界设置选中的下标的方法 */
- (void)setSelectedIndex:(NSInteger)selectedIndex animated:(BOOL)animated {
    [self.segmentView setSelectedIndex:selectedIndex animated:animated];
}

/**  给外界重新设置视图内容的标题的方法 */
- (void)reloadChildVcsWithNewChildVcs:(NSArray *)newChildVcs {
    
    self.childVcs = nil;
    self.titlesArray = nil;
    self.childVcs = newChildVcs;
    
    NSMutableArray *tempTitles = [NSMutableArray array];
    for (UIViewController *childVc in self.childVcs) {
        NSAssert(childVc.title, @"子控制器的title没有正确设置!!");
        if (childVc.title) {
            [tempTitles addObject:childVc.title];
        }
    }
    self.titlesArray = [NSArray arrayWithArray:tempTitles];
    
    [self.segmentView reloadTitlesWithNewTitles:self.titlesArray];
    [self.contentView reloadAllViewsWithNewChildVcs:self.childVcs];
}


#pragma mark - getter ---- setter

- (ZJContentView *)contentView {
    if (!_contentView) {
        ZJContentView *content = [[ZJContentView alloc] initWithFrame:CGRectMake(0.0, CGRectGetMaxY(self.segmentView.frame), self.bounds.size.width, self.bounds.size.height - CGRectGetMaxY(self.segmentView.frame)) childVcs:self.childVcs segmentView:self.segmentView parentViewController:self.parentViewController];
        [self addSubview:content];
        _contentView = content;
    }
    
    return  _contentView;
}


- (ZJScrollSegmentView *)segmentView {
    if (!_segmentView) {
        __weak typeof(self) weakSelf = self;
        ZJScrollSegmentView *segment = [[ZJScrollSegmentView alloc] initWithFrame:CGRectMake((MAINSCREEN_W-150*WIDTH_SCALE)/2, 0, 150, self.segmentStyle.segmentHeight) segmentStyle:self.segmentStyle titles:self.titlesArray titleDidClick:^(UILabel *label, NSInteger index) {
            segment.backgroundColor = [UIColor clearColor];
            [weakSelf.contentView setContentOffSet:CGPointMake(weakSelf.contentView.bounds.size.width * index, 0.0) animated:NO];
            
        }];
        [self addSubview:segment];
        
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(segment.frame)-1, MAINSCREEN_W, 1)];
#warning 替换下划线颜色
        bottomLine.backgroundColor = [UIColor clearColor];
        [segment insertSubview:bottomLine atIndex:0];
        
        _segmentView = segment;
    }
    return _segmentView;
}


- (NSArray *)childVcs {
    if (!_childVcs) {
        _childVcs = [NSArray array];
    }
    return _childVcs;
}

- (NSArray *)titlesArray {
    if (!_titlesArray) {
        _titlesArray = [NSArray array];
    }
    return _titlesArray;
}

- (void)setExtraBtnOnClick:(ExtraBtnOnClick)extraBtnOnClick {
    _extraBtnOnClick = extraBtnOnClick;
    self.segmentView.extraBtnOnClick = extraBtnOnClick;
}

@end
