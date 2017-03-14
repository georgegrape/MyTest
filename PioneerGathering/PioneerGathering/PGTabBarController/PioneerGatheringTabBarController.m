//
//  PioneerGatheringTabBarController.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/8.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "PioneerGatheringTabBarController.h"

#import "MainViewController.h"
#import "AcademyViewController.h"
#import "MyViewController.h"

@interface PioneerGatheringTabBarController () <UITabBarControllerDelegate>

@property (nonatomic, strong)MainViewController *mainVC;
@property (nonatomic, strong)AcademyViewController *academyVC;
@property (nonatomic, strong)MyViewController *myVC;

@end

@implementation PioneerGatheringTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubviews];
}

- (void)setupSubviews
{
    //AcademyView
    _mainVC = [[MainViewController alloc] init];
    _mainVC.tabBarItem.title = @"主页";
    _mainVC.tabBarItem.image = [[UIImage imageNamed:@"mainoff"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _mainVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"mainon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _mainVC.tabBarItem.tag = 0;
    [self unSelectedTapTabBarItems:_mainVC.tabBarItem];
    [self selectedTapTabBarItems:_mainVC.tabBarItem];
    
    //AcademyView
    _academyVC = [[AcademyViewController alloc] init];
    _academyVC.tabBarItem.title = @"学院";
    _academyVC.tabBarItem.image = [[UIImage imageNamed:@"academyoff"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _academyVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"academyon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _academyVC.tabBarItem.tag = 1;
    [self unSelectedTapTabBarItems:_academyVC.tabBarItem];
    [self selectedTapTabBarItems:_academyVC.tabBarItem];
    
    //Me
    _myVC = [[MyViewController alloc] init];
    _myVC.tabBarItem.title = @"我的";
    _myVC.tabBarItem.image=[[UIImage imageNamed:@"myoff"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _myVC.tabBarItem.selectedImage=[[UIImage imageNamed:@"myon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    _myVC.tabBarItem.tag = 2;
    [self unSelectedTapTabBarItems:_myVC.tabBarItem];
    [self selectedTapTabBarItems:_myVC.tabBarItem];
    
    self.viewControllers = @[_mainVC, _academyVC, _myVC];
//    [self selectedTapTabBarItems:_activityListVC.tabBarItem];
}

#pragma mark - UITabBarDelegate
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    if (item.tag == 0) {
        self.navigationItem.rightBarButtonItem = nil;
        [self.navigationController setNavigationBarHidden:YES animated:NO];
//        [self.navigationItem setTitleView:nil];
    } else if (item.tag == 1) {
        self.title = nil;
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.leftBarButtonItems = nil;
        self.navigationItem.rightBarButtonItem = nil;
        [self.navigationController setNavigationBarHidden:YES animated:NO];
//        [self.navigationItem setTitleView:nil];
    } else if (item.tag == 2) {
        self.title = @"我的信息";
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.leftBarButtonItems = nil;
        self.navigationItem.rightBarButtonItem = nil;
        [self.navigationController setNavigationBarHidden:NO animated:NO];
//        [self.navigationItem setTitleView:nil];
    }
}

- (void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem {
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:10], NSFontAttributeName, RGBACOLOR(178, 178, 178, 1), NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateNormal];
}

- (void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem {
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:10],
                                        NSFontAttributeName, RGBACOLOR(255, 90, 95, 1), NSForegroundColorAttributeName,
                                        nil] forState:UIControlStateSelected];
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
