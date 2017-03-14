//
//  MainViewController.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/8.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "MainViewController.h"

#import "HYBLoopScrollView.h"
#import "MainAbilityView.h"
#import "GQSTextAndImageView.h"

#import "NewsViewController.h"
#import "KnowledgeStoreController.h"
#import "RelationshipController.h"
#import "ProjectViewController.h"
#import "SearchViewController.h"
#import "CitiesViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) HYBLoopScrollView *loopImageView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self createUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)createUI {
    
    // 这个图片会找不到，而显示默认图
    NSString *url = @"http://test.meirongzongjian.com/imageServer/user/3/42ccb9c75ccf5e910cd6f5aaf0cd1200.jpg";
    NSArray *images = @[@"http://s0.pimg.cn/group5/M00/5B/6D/wKgBfVaQf0KAMa2vAARnyn5qdf8958.jpg?imageMogr2/strip/thumbnail/1200%3E/quality/95",
                        @"http://7xrs9h.com1.z0.glb.clouddn.com/wp-content/uploads/2016/03/QQ20160322-0@2x.png",
                        @"http://s0.pimg.cn/group6/M00/45/84/wKgBjVZVjYCAEIM4AAKYJZIpvWo152.jpg?imageMogr2/strip/thumbnail/1200%3E/quality/95",
                        url,
                        @"http://7xrs9h.com1.z0.glb.clouddn.com/wp-content/uploads/2016/03/QQ20160322-5@2x-e1458635879420.png"
                        ];
    
//    NSArray *titles = @[@"Thank you for your support!",
//                        @"Contact me if any quetion.",
//                        @"Email me huangyibiao520@163.com.",
//                        @"Thank you again.",
//                        @"博客：www.henishuo.com",
//                        @"github: https://coderJackyHuang",
//                        @"微博：weibo.com/huangyibiao520"
//                        ];
    
    // 状态栏开始的。
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    /**
     为了消除因为隐藏导航栏而产生的视图下移的bug
     */
    UIView *debugLine = [[UIView alloc] init];
    debugLine.backgroundColor = [UIColor clearColor];
    [self.view addSubview:debugLine];
    [debugLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(1);
    }];
    
    HYBLoopScrollView *loop = [HYBLoopScrollView loopScrollViewWithFrame:CGRectMake(0, 20, 320, 120) imageUrls:images timeInterval:200 didSelect:^(NSInteger atIndex) {
        
    } didScroll:^(NSInteger toIndex) {
        
    }];
    
    loop.backgroundColor = [UIColor whiteColor];
    loop.shouldAutoClipImageToViewSize = NO;
    loop.placeholder = [UIImage imageNamed:@"default.png"];
    
    loop.alignment = kPageControlAlignCenter;
//    loop.adTitles = titles;
    
    [self.view addSubview:loop];
    [loop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo((MAINSCREEN_H-(20+44)*HEIGHT_SCALE)/2 - 55*HEIGHT_SCALE);
        make.top.equalTo(self.view.mas_top).offset(20*HEIGHT_SCALE);
    }];
    self.loopImageView = loop;
    
    loop.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    // page control小圆点太小？可以修改的
    loop.pageControl.size = 10*WIDTH_SCALE;
    
    // 不希望显示pagecontrol？
    //  loop.pageControl.hidden = YES;
    // 或者直接
    //  [loop.pageControl removeFromSuperview];
    
    // 默认的是UIViewContentModeScaleAspectFit
//    loop.imageContentMode = UIViewContentModeScaleToFill;
//    loop.imageContentMode = UIViewContentModeScaleAspectFill;
    
    NSLog(@"size: %llu", [loop imagesCacheSize]);
    [loop clearImagesCache];
    
    UIView *mainAbilityView = [self mainAbilityView];
    [self.view addSubview:mainAbilityView];
    [mainAbilityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loop.mas_bottom).offset(10*HEIGHT_SCALE);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-(44+20)*HEIGHT_SCALE);
    }];
    
    UIView *topToolView = [self topToolView];
    [self.view addSubview:topToolView];
    [topToolView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loop.mas_top);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(40*WIDTH_SCALE);
    }];
}

- (UIView *)topToolView {
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = RGBACOLOR(0, 0, 0, .3);
    
    GQSTextAndImageView *citiesButton = [[GQSTextAndImageView alloc] initWithFrame:CGRectZero Image:[UIImage imageNamed:@"city_button"] Text:@"北京" andExhibitDirection:GQSTextLeftImageRight isButton:YES];
    
    citiesButton.clickAction = ^ {
        GQSLog(@"11122");
        CitiesViewController *citiesVC = [[CitiesViewController alloc] init];
        [self.navigationController presentViewController:citiesVC animated:YES completion:nil];
    };
    
    [backView addSubview:citiesButton];
    [citiesButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backView.mas_centerY);
        make.left.equalTo(backView.mas_left).offset(20*WIDTH_SCALE);
    }];
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    searchButton.backgroundColor = [UIColor orangeColor];
    [searchButton addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:searchButton];
    [searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(backView.mas_centerY);
        make.right.equalTo(backView.mas_right).offset(-20*WIDTH_SCALE);
        make.width.height.mas_equalTo(20*WIDTH_SCALE);
    }];
    
    return backView;
}

- (UIView *)mainAbilityView {
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    
    /**
     *  横线
     */
    UIView *horizontalLine = [[UIView alloc] init];
    horizontalLine.backgroundColor = [UIColor lightGrayColor];
    [backView addSubview:horizontalLine];
    [horizontalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(backView);
        make.width.mas_equalTo(MAINSCREEN_W-20*WIDTH_SCALE);
        make.height.mas_equalTo(1);
    }];
    
    /**
     *  竖线
     */
    UIView *verticalLine = [[UIView alloc] init];
    verticalLine.backgroundColor = [UIColor lightGrayColor];
    [backView addSubview:verticalLine];
    [verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backView.mas_centerX);
        make.top.equalTo(backView.mas_top).offset(10*HEIGHT_SCALE);
        make.bottom.equalTo(backView.mas_bottom).offset(-10*HEIGHT_SCALE);
        make.width.mas_equalTo(1);
    }];
    
    NSArray *mainTitleArray = @[@"号外", @"智库", @"猪圈儿", @"攒事儿"];
//    NSArray *textIconArray = @[[UIImage imageNamed:@""], [UIImage imageNamed:@""], [UIImage imageNamed:@""], [UIImage imageNamed:@""]];
    NSArray *descriptionArray = @[@"行业要闻\n随到随读", @"创业知识\n一秒掌握", @"人脉活动\n随时享有", @"商机有限\n价值无限"];
//    NSArray *mainIconArray = @[[UIImage imageNamed:@""], [UIImage imageNamed:@""], [UIImage imageNamed:@""], [UIImage imageNamed:@""]];
    
#warning 替换图片
    for (int i = 0; i < 4; i++) {
        switch (i) {
            case 0:
            {
                MainAbilityView *abilityView = [self buildAbilityViewWithMainTitle:mainTitleArray[i] textIcon:[UIImage imageNamed:@"textIcon"] describText:descriptionArray[i] mainIcon:[UIImage imageNamed:@"mainIcon"]];
                
                abilityView.jumpToController = ^{
                    
                    NewsViewController *newsVC = [[NewsViewController alloc] init];
                    newsVC.title = @"号外";
                    [self.navigationController pushViewController:newsVC animated:YES];
                };
                
                [backView addSubview:abilityView];
                [abilityView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.left.equalTo(backView);
                    make.right.equalTo(verticalLine.mas_left);
                    make.bottom.equalTo(horizontalLine.mas_top);
                }];
            }
                break;
                
            case 1:
            {
                MainAbilityView *abilityView = [self buildAbilityViewWithMainTitle:mainTitleArray[i] textIcon:[UIImage imageNamed:@"textIcon"] describText:descriptionArray[i] mainIcon:[UIImage imageNamed:@"mainIcon"]];
                
                abilityView.jumpToController = ^{
                    
                    KnowledgeStoreController *ksVC = [[KnowledgeStoreController alloc] init];
                    ksVC.title = @"智库";
                    [self.navigationController pushViewController:ksVC animated:YES];
                };
                
                [backView addSubview:abilityView];
                [abilityView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.right.equalTo(backView);
                    make.left.equalTo(verticalLine.mas_right);
                    make.bottom.equalTo(horizontalLine.mas_top);
                }];
            }
                break;
                
            case 2:
            {
                MainAbilityView *abilityView = [self buildAbilityViewWithMainTitle:mainTitleArray[i] textIcon:[UIImage imageNamed:@"textIcon"] describText:descriptionArray[i] mainIcon:[UIImage imageNamed:@"mainIcon"]];
                
                abilityView.jumpToController = ^{
                    
                    RelationshipController *rsVC = [[RelationshipController alloc] init];
                    rsVC.title = @"猪圈";
                    [self.navigationController pushViewController:rsVC animated:YES];
                };
                
                [backView addSubview:abilityView];
                [abilityView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(horizontalLine.mas_bottom);
                    make.right.equalTo(verticalLine.mas_left);
                    make.bottom.left.equalTo(backView);
                }];
            }
                break;
                
            case 3:
            {
                MainAbilityView *abilityView = [self buildAbilityViewWithMainTitle:mainTitleArray[i] textIcon:[UIImage imageNamed:@"textIcon"] describText:descriptionArray[i] mainIcon:[UIImage imageNamed:@"mainIcon"]];
                
                abilityView.jumpToController = ^{
                    
                    ProjectViewController *projectVC = [[ProjectViewController alloc] init];
                    projectVC.title = @"攒事儿";
                    [self.navigationController pushViewController:projectVC animated:YES];
                };
                
                [backView addSubview:abilityView];
                [abilityView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(horizontalLine.mas_bottom);
                    make.left.equalTo(verticalLine.mas_right);
                    make.bottom.right.equalTo(backView);
                }];
            }
                break;
                
            default:
                break;
        }
    }
    
    return backView;
}

- (MainAbilityView *)buildAbilityViewWithMainTitle:(NSString *)mainTitle
                             textIcon:(UIImage *)textIcon
                          describText:(NSString *)describText
                             mainIcon:(UIImage *)mainIcon {
    
    MainAbilityView *abilityView = [[MainAbilityView alloc] initWithFrame:CGRectZero mainTitle:mainTitle textIcon:textIcon describText:describText mainIcon:mainIcon];
    
    return abilityView;
}

- (void)searchAction {
    GQSLog(@"dfadsfafafasfadf");
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
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
