//
//  NewsViewController.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/9.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "NewsViewController.h"

#import "NewsCell.h"
#import "NewsModel.h"

@interface NewsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setLeftBackBarButtonItem:nil];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = [[NSMutableArray alloc] init];
    
    NSArray *imagesUrl = @[@"http://s0.pimg.cn/group5/M00/5B/6D/wKgBfVaQf0KAMa2vAARnyn5qdf8958.jpg?imageMogr2/strip/thumbnail/1200%3E/quality/95",@"http://s0.pimg.cn/group5/M00/5B/6D/wKgBfVaQf0KAMa2vAARnyn5qdf8958.jpg?imageMogr2/strip/thumbnail/1200%3E/quality/95",@"http://s0.pimg.cn/group5/M00/5B/6D/wKgBfVaQf0KAMa2vAARnyn5qdf8958.jpg?imageMogr2/strip/thumbnail/1200%3E/quality/95",];
    
    NSDictionary *dict = @{@"newsId" : @"10",
                           @"title" : @"创客项目《我的未来》众筹8000万 超200%完美落幕 庆祝晚宴将于今晚于四季大酒店举办",
                           @"imagesUrl" : imagesUrl,
                           @"time" : @"5分钟前",
                           @"comment" : @"120评论"};
    NewsModel *model = [[NewsModel alloc] initWithDictionary:dict error:nil];
    
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsModel *model = self.dataArray[indexPath.row];
    
    return [NewsCell hyb_heightForTableView:tableView config:^(UITableViewCell *sourceCell) {
        NewsCell *cell = (NewsCell *)sourceCell;
        // 配置数据
        cell.model = model;
    } cache:^NSDictionary *{
        return @{kHYBCacheUniqueKey: model.newsId,
                 kHYBCacheStateKey : @"expanded",
                 // 如果设置为YES，若有缓存，则更新缓存，否则直接计算并缓存
                 // 主要是对社交这种有动态评论等不同状态，高度也会不同的情况的处理
                 kHYBRecalculateForStateKey : @(NO) // 标识不用重新更新
                 };
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"NewsCell";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NewsModel *model = self.dataArray[indexPath.row];
    
    cell.model = model;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NewsModel *model = self.dataArray[indexPath.row];
    
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
