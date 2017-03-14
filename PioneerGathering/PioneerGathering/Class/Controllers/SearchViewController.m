//
//  SearchViewController.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/10.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController () <UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UIView * _backView_search;
    UISearchBar * _searchBar;
    NSInteger currentPage;
    NSInteger searchPage;
}

@property (nonatomic, strong) UITableView *myTableView;
// 搜索结果
@property (nonatomic, strong) NSMutableArray *resultArray;

@property (nonatomic, strong) NSString *searchString;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self setLeftBackBarButtonItem:nil];
    self.view.backgroundColor = [UIColor greenColor];
    self.searchString = @"";
    self.resultArray = [[NSMutableArray alloc] init];
    
    [self createNavigationBar];
    [self createUI];
}

- (void)createUI {
    
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(5);
        make.bottom.left.right.equalTo(self.view);
    }];
}

- (UIView *)toolView {
    UIView *backView = [[UIView alloc] init];
    
    UIImageView *divideLine = [[UIImageView alloc] init];
    divideLine.backgroundColor = [UIColor whiteColor];
    [backView addSubview:divideLine];
    
    
    return backView;
}

- (UITableView *)myTableView {
    if (_myTableView == nil) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _myTableView.backgroundColor = [UIColor whiteColor];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTableView.rowHeight = 115;
        
        _myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            currentPage = 0;
            
        }];
        _myTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            currentPage ++;
            
        }];
        
        [self.view addSubview:_myTableView];
    }
    
    return _myTableView;
}

- (void)createNavigationBar {
    _backView_search = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 40.0f)];
    _backView_search.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_backView_search];
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"搜索商品";
    UITextField *searchField=[_searchBar valueForKey:@"_searchField"];
    searchField.font = [UIFont systemFontOfSize:13];
    searchField.backgroundColor = ZY_BGCOLOR;
    searchField.tintColor = [UIColor blueColor];
    _searchBar.barTintColor = ZY_BGCOLOR;
    _searchBar.returnKeyType = UIReturnKeySearch;
    [_backView_search addSubview:_searchBar];
    
    // 去除黑线
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.1) {
        [[[[ _searchBar.subviews objectAtIndex : 0 ] subviews ] objectAtIndex : 0 ] removeFromSuperview ];
        
        [ _searchBar setBackgroundColor :[ UIColor clearColor ]];
    } else {
        [[[[ _searchBar.subviews objectAtIndex : 0 ] subviews ] objectAtIndex : 0 ] removeFromSuperview ];
        
        [ _searchBar setBackgroundColor :[ UIColor clearColor ]];
    }
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_backView_search.mas_centerY);
        make.centerX.equalTo(_backView_search.mas_centerX);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(25);
    }];
    
    _searchBar.frame = CGRectMake(0, 7.5, 250, 25);
    
    self.navigationItem.titleView = _backView_search;
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"ProductionsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
//    ProductionListModel *model = [self.resultArray objectAtIndex:indexPath.row];
//    
//    cell.model = model;
//    
//    cell.checkMore = ^(ProductionListModel *model) {
//        NSLog(@"%@",model);
//        ProductionDetailController *pdVC = [[ProductionDetailController alloc] init];
//        pdVC.listModel = model;
//        [self.navigationController pushViewController:pdVC animated:YES];
//    };
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_searchBar resignFirstResponder];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    ProductionListModel *model = self.resultArray[indexPath.row];
//    
//    ProductionDetailController *pdVC = [[ProductionDetailController alloc] init];
//    pdVC.listModel = model;
//    [self.navigationController pushViewController:pdVC animated:YES];
}

#pragma mark - UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    _searchBar.showsCancelButton = YES;
    for (id obj in [searchBar subviews]) {
        if ([obj isKindOfClass:[UIView class]]) {
            for (id obj2 in [obj subviews]) {
                if ([obj2 isKindOfClass:[UIButton class]]) {
                    UIButton *btn = (UIButton *)obj2;
                    [btn setTitle:@"取消" forState:UIControlStateNormal];
                    [btn setTitleColor:ZY_DEFAULT_TEXT_COLOR forState:UIControlStateNormal];
                    btn.titleLabel.font = [UIFont systemFontOfSize:13];
                }
            }
        }
    }
    
    return YES;
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    
    [self.myTableView reloadData];
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    self.searchString = searchBar.text;
//    [self requestProductionList];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [_searchBar resignFirstResponder];
    _searchBar.showsCancelButton = NO;
}

//- (void)createNavigationBar {
//    UIView *navView = [[UIView alloc] init];
//    navView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:navView];
//    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(0);
//        make.height.mas_equalTo(50);
//    }];
//    
//    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backBtn setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
//    [backBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
//    [navView addSubview:backBtn];
//    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(navView.mas_centerY);
//        make.left.equalTo(navView.mas_left).offset(22*WIDTH_SCALE);
//    }];
//    
//    
//}

- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
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
