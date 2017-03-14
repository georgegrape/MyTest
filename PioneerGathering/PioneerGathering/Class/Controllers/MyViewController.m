//
//  MyViewController.m
//  PioneerGathering
//
//  Created by reneboy on 16/11/8.
//  Copyright © 2016年 reneboy. All rights reserved.
//

#import "MyViewController.h"

#import "PrivateCenterController.h"
#import "MyKnowledgeStoreController.h"
#import "MyInformationCell.h"

@interface MyViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray *titleArray;

@property (nonatomic, strong) NSMutableArray *iconArray;

@property (nonatomic, strong) UIView *headerView;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *arr = @[@"个人中心", @"我的智库", @"我的学员", @"我的猪圈儿", @"我攒的事儿"];
    
    self.titleArray = [[NSMutableArray alloc] init];
    self.titleArray = arr.mutableCopy;
    self.iconArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 5; i++) {
        [self.iconArray addObject:[UIImage imageNamed:@"textIcon"]];
    }
    
    self.view.backgroundColor = [UIColor redColor];
    [self createUI];
}

- (void)createUI {
    [self.myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(MAINSCREEN_H-64-49);
    }];
}

- (UIView *)headerView {
    if (!_headerView) {
        UIView *backView = [[UIView alloc] init];
        backView.backgroundColor = [UIColor whiteColor];
        _headerView = backView;
        
        UIView *myInfoView = [[UIView alloc] init];
        myInfoView.backgroundColor = [UIColor clearColor];
        myInfoView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        myInfoView.layer.borderWidth = 1;
        [backView addSubview:myInfoView];
        
        UIImageView *avatarView = [[UIImageView alloc] init];
        avatarView.backgroundColor = [UIColor purpleColor];
        //    [avatarView sd_setImageWithURL:[NSURL URLWithString:] placeholderImage:<#(UIImage *)#>]
        [myInfoView addSubview:avatarView];
        [avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(myInfoView.mas_top).offset(15);
            make.left.equalTo(myInfoView.mas_left).offset(15*WIDTH_SCALE);
            //
            make.width.height.mas_equalTo(40*WIDTH_SCALE);
        }];
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
        nameLabel.text = @"林心如";
        [myInfoView addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(avatarView.mas_top);
            make.left.equalTo(avatarView.mas_right).offset(10*WIDTH_SCALE);
        }];
        
        GQSTextAndImageView *verifyView = [[GQSTextAndImageView alloc] initWithFrame:CGRectZero Image:[UIImage imageNamed:@"mainIcon"] Text:@"身份已认证" andExhibitDirection:GQSTextRightImageLeft isButton:YES];
        verifyView.imageSize = CGSizeMake(15*WIDTH_SCALE, 15*WIDTH_SCALE);
        verifyView.textFont = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
        verifyView.textColor = [UIColor orangeColor];
        verifyView.clickAction = ^ {
            GQSLog(@"身份已认证");
            [appdel showHudwithTitle:@"身份已认证" detail:nil];
        };
        [myInfoView addSubview:verifyView];
        [verifyView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(nameLabel.mas_centerY);
            make.left.equalTo(nameLabel.mas_right).offset(15*WIDTH_SCALE);
        }];
        
        UILabel *dutyLabel = [[UILabel alloc] init];
        dutyLabel.font = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
        dutyLabel.textColor = [UIColor lightGrayColor];
        dutyLabel.text = @"创客汇科技责任公司市场经理";
        [myInfoView addSubview:dutyLabel];
        [dutyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(avatarView.mas_bottom);
            make.left.equalTo(nameLabel.mas_left);
        }];
        
        UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        settingBtn.backgroundColor = [UIColor orangeColor];
        [settingBtn addTarget:self action:@selector(settingAction) forControlEvents:UIControlEventTouchUpInside];
        [myInfoView addSubview:settingBtn];
        [settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.equalTo(myInfoView);
            make.width.mas_equalTo(60*WIDTH_SCALE);
            make.height.mas_equalTo(40*WIDTH_SCALE);
        }];
        
        UIView *phoneNumView = [self buildViewWithTitle:@"手机："
                                              titleFont:[UIFont systemFontOfSize:12*HEIGHT_SCALE]
                                             titleColor:[UIColor lightGrayColor]
                                            description:@"13744333321"
                                        descriptionFont:[UIFont systemFontOfSize:12*HEIGHT_SCALE]
                                       descriptionColor:[UIColor blueColor]];
        [myInfoView addSubview:phoneNumView];
        [phoneNumView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(avatarView.mas_bottom).offset(15*HEIGHT_SCALE);
            make.left.equalTo(avatarView.mas_left);
        }];
        
        UIView *emailView = [self buildViewWithTitle:@"邮箱："
                                           titleFont:[UIFont systemFontOfSize:12*HEIGHT_SCALE]
                                          titleColor:[UIColor lightGrayColor]
                                         description:@"13744333321@qq.com"
                                     descriptionFont:[UIFont systemFontOfSize:12*HEIGHT_SCALE]
                                    descriptionColor:[UIColor blueColor]];
        [myInfoView addSubview:emailView];
        [emailView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(phoneNumView.mas_bottom).offset(5);
            make.left.equalTo(phoneNumView.mas_left);
        }];
        
        UIView *districtView = [self buildViewWithTitle:@"地区："
                                              titleFont:[UIFont systemFontOfSize:12*HEIGHT_SCALE]
                                             titleColor:[UIColor lightGrayColor]
                                            description:@"北京海淀"
                                        descriptionFont:[UIFont systemFontOfSize:12*HEIGHT_SCALE]
                                       descriptionColor:[UIColor blueColor]];
        [myInfoView addSubview:districtView];
        [districtView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(emailView.mas_bottom).offset(5);
            make.left.equalTo(phoneNumView.mas_left);
        }];
        
        UIImageView *logoView = [[UIImageView alloc] init];
        logoView.backgroundColor = [UIColor purpleColor];
        [myInfoView addSubview:logoView];
        [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(phoneNumView.mas_top);
            make.bottom.equalTo(districtView.mas_bottom);
            make.right.equalTo(myInfoView.mas_right).offset(-10*WIDTH_SCALE);
            make.width.mas_equalTo(40*WIDTH_SCALE);
        }];
        
        GQSTextAndImageView *openVipView = [[GQSTextAndImageView alloc] initWithFrame:CGRectZero Image:[UIImage imageNamed:@"mainIcon"] Text:@"您还不是会员，立即开通" andExhibitDirection:GQSTextRightImageLeft isButton:YES];
        openVipView.imageSize = CGSizeMake(22*WIDTH_SCALE, 22*WIDTH_SCALE);
        openVipView.textFont = [UIFont systemFontOfSize:13*HEIGHT_SCALE];
        openVipView.padding = 8;
        openVipView.clickAction = ^ {
            GQSLog(@"开通会员");
            [appdel showHudwithTitle:@"开通会员" detail:nil];
        };
        [myInfoView addSubview:openVipView];
        [openVipView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(districtView.mas_bottom).offset(10);
            make.left.equalTo(districtView.mas_left);
        }];
        
        UIImageView *arrowIcon = [[UIImageView alloc] init];
        arrowIcon.backgroundColor = [UIColor orangeColor];
        [myInfoView addSubview:arrowIcon];
        [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(openVipView.mas_centerY);
            make.left.equalTo(openVipView.mas_right).offset(10*WIDTH_SCALE);
            
            //
            make.width.height.mas_equalTo(15*WIDTH_SCALE);
        }];
        
        [myInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(backView.mas_top).offset(10);
            make.bottom.equalTo(openVipView.mas_bottom).offset(10);
            make.left.equalTo(backView.mas_left).offset(10*WIDTH_SCALE);
            make.width.mas_equalTo(MAINSCREEN_W-20*WIDTH_SCALE);
        }];
        
        [myInfoView layoutIfNeeded];
        backView.frame = CGRectMake(0, 0, MAINSCREEN_W-20*WIDTH_SCALE, myInfoView.frame.size.height+50);
    }
    return _headerView;
}

- (UIView *)buildViewWithTitle:(NSString *)title
                     titleFont:(UIFont *)titleFont
                    titleColor:(UIColor *)titleColor
                   description:(NSString *)description
               descriptionFont:(UIFont *)descriptionFont
              descriptionColor:(UIColor *)descriptionColor {
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor clearColor];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = titleFont;
    titleLabel.textColor = titleColor;
    titleLabel.text = title;
    [backView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(backView);
    }];
    
    UILabel *descriptionLabel = [[UILabel alloc] init];
    descriptionLabel.font = descriptionFont;
    descriptionLabel.textColor = descriptionColor;
    descriptionLabel.text = description;
    [backView addSubview:descriptionLabel];
    [descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.mas_top);
        make.left.equalTo(titleLabel.mas_right);
    }];
    
    [titleLabel layoutIfNeeded];
    [descriptionLabel layoutIfNeeded];
    
    [backView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(titleLabel.mas_height);
        make.width.mas_equalTo(titleLabel.frame.size.width+descriptionLabel.frame.size.width);
    }];
    
    return backView;
}

- (void)settingAction {
    GQSLog(@"我是设置");
}

- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _myTableView.backgroundColor = [UIColor clearColor];
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.showsHorizontalScrollIndicator = NO;
        _myTableView.showsVerticalScrollIndicator = NO;
//        _myTableView.scrollEnabled = NO;
        _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _myTableView.rowHeight = 44;

        _myTableView.tableHeaderView = self.headerView;
        [self.view addSubview:_myTableView];
    }
    return _myTableView;
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"MyInformationCell";
    MyInformationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MyInformationCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.iconImage = self.iconArray[indexPath.row];
    cell.title = self.titleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            PrivateCenterController *pcVC = [[PrivateCenterController alloc] init];
            [self.navigationController pushViewController:pcVC animated:YES];
        }
            break;
            
        case 1:
        {
            MyKnowledgeStoreController *mksVC = [[MyKnowledgeStoreController alloc] init];
            [self.navigationController pushViewController:mksVC animated:YES];
        }
            break;
            
        case 2:
        {
            
        }
            break;
            
        case 3:
        {
            
        }
            break;
            
        case 4:
        {
            
        }
            break;
            
        default:
            break;
    }
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
