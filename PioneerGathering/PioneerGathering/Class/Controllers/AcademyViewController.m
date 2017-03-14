//
//  AcademyViewController.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/8.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "AcademyViewController.h"

#import "ZJScrollPageView.h"
#import "AcademyFirstController.h"
#import "AcademySecondController.h"

@interface AcademyViewController ()

@end

@implementation AcademyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    [self createUI];
}

- (void)createUI {
    
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
    //显示滚动条
    style.showLine = YES;
    
    // 颜色渐变
    style.gradualChangeTitleColor = YES;
    
    // 设置标题不滚动
    style.scrollTitle = NO;
    
    style.scrollLineHeight = 3;
    
    style.scrollLineColor = [UIColor whiteColor];
    
    style.titleFont = [UIFont systemFontOfSize:14*HEIGHT_SCALE];
    
    style.normalTitleColor = UIColorFromHex(0x000000);
    
    style.selectedTitleColor = UIColorFromHex(0xffffff);
    
    // 设置子控制器 --- 注意子控制器需要设置title, 将用于对应的tag显示title
    NSArray *childVcs = [NSArray arrayWithArray:[self setupChildVcAndTitle]];
    // 初始化
    ZJScrollPageView *scrollPageView = [[ZJScrollPageView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20.0 - 44) segmentStyle:style childVcs:childVcs parentViewController:self];
    
    [self.view addSubview:scrollPageView];
//    self.navigationItem.titleView = scrollPageView;
    
}

- (NSArray *)setupChildVcAndTitle {
    
    NSArray *childVcs;
    
    AcademyFirstController *vc1 = [AcademyFirstController new];
    vc1.view.backgroundColor = [UIColor purpleColor];
    vc1.title = @"商学院";
    
    AcademySecondController *vc2 = [AcademySecondController new];
    vc2.view.backgroundColor = [UIColor blueColor];
    vc2.title = @"禅修班";
    
    childVcs = [NSArray arrayWithObjects:vc1, vc2, nil];
    
    return childVcs;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
