//
//  AcademySecondController.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/8.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "AcademySecondController.h"

#import "BusinessOrMeditationDetailController.h"
#import "BusinessOrMeditationCell.h"
#import "BusinessOrMeditaitionModel.h"

@interface AcademySecondController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation AcademySecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    NSDictionary *dict = @{@"businessId" : @"1",
                           @"title" : @"【北京】创客项目管理公司组织架构线下课程",
                           @"imageUrl" : @"http://s0.pimg.cn/group5/M00/5B/6D/wKgBfVaQf0KAMa2vAARnyn5qdf8958.jpg?imageMogr2/strip/thumbnail/1200%3E/quality/95",
                           @"name" : @"林心如",
                           @"duty" : @"百度市场总监",
                           @"price" : @"8800",
                           @"date" : @"12月1日-12月3日",
                           @"position" : @"北京中关村百度总部1号大厅"};
    BusinessOrMeditaitionModel *model = [[BusinessOrMeditaitionModel alloc] initWithDictionary:dict error:nil];
    
    for (int i = 0; i < 10; i++) {
        [self.dataArray addObject:model];
    }
    
    
    [self createUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)createUI {
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 10;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BusinessOrMeditaitionModel *model = self.dataArray[indexPath.section];
    
    return [BusinessOrMeditationCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
        BusinessOrMeditationCell *cell = (BusinessOrMeditationCell *)sourceCell;
        // 配置数据
        cell.model = model;
    } cache:^NSDictionary *{
        return @{kHYBCacheUniqueKey: model.businessId,
                 kHYBCacheStateKey : @"expanded",
                 // 如果设置为YES，若有缓存，则更新缓存，否则直接计算并缓存
                 // 主要是对社交这种有动态评论等不同状态，高度也会不同的情况的处理
                 kHYBRecalculateForStateKey : @(NO) // 标识不用重新更新
                 };
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"BusinessSchoolCell";
    BusinessOrMeditationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[BusinessOrMeditationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    BusinessOrMeditaitionModel *model = self.dataArray[indexPath.section];
    
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BusinessOrMeditaitionModel *model = self.dataArray[indexPath.section];
    
    BusinessOrMeditationDetailController *bdVC = [[BusinessOrMeditationDetailController alloc] init];
    bdVC.businessId = model.businessId;
    [self.navigationController pushViewController:bdVC animated:YES];
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
