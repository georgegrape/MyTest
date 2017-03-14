//
//  KnowledgeStoreController.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/9.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "KnowledgeStoreController.h"

#import "BlockActionButton.h"
#import "KnowledgeStoreCell.h"
#import "KnowledgeStoreModel.h"

@interface KnowledgeStoreController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation KnowledgeStoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLeftBackBarButtonItem:nil];
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    NSDictionary *dict = @{@"knowledgeId" : @"101",
                           @"title" : @"创客项目《我的未来》众筹8000万 超200%完美落幕 庆祝晚宴将于今晚于四季大酒店举办",
                           @"imageUrl" : @"http://s0.pimg.cn/group5/M00/5B/6D/wKgBfVaQf0KAMa2vAARnyn5qdf8958.jpg?imageMogr2/strip/thumbnail/1200%3E/quality/95",
                           @"time" : @"5分钟前",
                           @"comment" : @"120评论",
                           @"collection" : @"200收藏"};
    KnowledgeStoreModel *model = [[KnowledgeStoreModel alloc] initWithDictionary:dict error:nil];
    
    for (int i = 0; i < 10; i++) {
        [self.dataArray addObject:model];
    }
    
    [self createUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)createUI {
    UIScrollView *menuView = [self menuView];
    [self.view addSubview:menuView];
    [menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(30*HEIGHT_SCALE);
    }];
    
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(menuView.mas_bottom).offset(5);
        make.bottom.left.right.equalTo(self.view);
    }];
}

- (UIScrollView *)menuView {
    UIScrollView *backView = [[UIScrollView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    backView.showsVerticalScrollIndicator = NO;
    backView.showsHorizontalScrollIndicator = NO;
    
    NSArray *titleArr = @[@"融资",@"管理",@"股权",@"办证",@"招聘",@"期权",@"外贸",@"双边",@"金融",@"奇葩",@"犯傻"];
    
    for (int i = 0; i < titleArr.count; i++) {
        BlockActionButton *button = [[BlockActionButton alloc] init];
        button.text = titleArr[i];
        button.font = [UIFont systemFontOfSize:12*HEIGHT_SCALE];
        button.textColor = [UIColor blueColor];
        button.boderColor = [UIColor blueColor];
        button.boderWidth = 1;
        button.cornerRadius = 4;
        button.tapAction = ^{
            GQSLog(@"我是##%d",i);
        };
        
        [backView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(backView.mas_centerY);
            make.left.equalTo(backView.mas_left).offset(10*WIDTH_SCALE+60*WIDTH_SCALE * i);
            make.width.mas_equalTo(50*WIDTH_SCALE);
            make.height.mas_equalTo(20*HEIGHT_SCALE);
        }];
    }
    
    backView.contentSize = CGSizeMake(60*WIDTH_SCALE*titleArr.count+10*WIDTH_SCALE, 30*HEIGHT_SCALE);
    
    return backView;
}

- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _myTableView.backgroundColor = [UIColor clearColor];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            
        }];
        
        _myTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            
            
        }];
        
        [self.view addSubview:_myTableView];
    }
    return _myTableView;
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KnowledgeStoreModel *model = self.dataArray[indexPath.row];
    
    return [KnowledgeStoreCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
        KnowledgeStoreCell *cell = (KnowledgeStoreCell *)sourceCell;
        // 配置数据
        cell.model = model;
    } cache:^NSDictionary *{
        return @{kHYBCacheUniqueKey: model.knowledgeId,
                 kHYBCacheStateKey : @"expanded",
                 // 如果设置为YES，若有缓存，则更新缓存，否则直接计算并缓存
                 // 主要是对社交这种有动态评论等不同状态，高度也会不同的情况的处理
                 kHYBRecalculateForStateKey : @(NO) // 标识不用重新更新
                 };
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"KnowledgeStoreCell";
    KnowledgeStoreCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[KnowledgeStoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    KnowledgeStoreModel *model = self.dataArray[indexPath.row];
    
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    KnowledgeStoreModel *model = self.dataArray[indexPath.row];
    
    //    BusinessOrMeditationDetailController *bdVC = [[BusinessOrMeditationDetailController alloc] init];
    //    bdVC.businessId = model.businessId;
    //    [self.navigationController pushViewController:bdVC animated:YES];
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
