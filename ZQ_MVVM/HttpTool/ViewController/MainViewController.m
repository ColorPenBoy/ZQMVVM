//
//  MainViewController.m
//  ZQ_MVVM
//
//  Created by colorPen on 15/6/29.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import "MainViewController.h"
#import "vc2Cell.h"
#import "HomeViewModel.h"
#import "HomeModel.h"
#import "HomeTableViewDataSource.h"
#import "MJRefresh.h"

#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface MainViewController ()<UITableViewDelegate>

@property (nonatomic, strong) HomeTableViewDataSource *dataSource_t;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MVVM_Demo";
    
    self.dataSource_t = [[HomeTableViewDataSource alloc]init];
    self.tableView.dataSource = self.dataSource_t;

    
    HomeViewModel *hvm = [[HomeViewModel alloc]init];
    
    [hvm setBlockWithSuccessBlock:^(NSMutableArray *objArray, BOOL isEnd) {
        
        [self.tableView.header endRefreshing];
        [self.tableView.footer endRefreshing];
        if (isEnd) {
            [self.tableView.footer noticeNoMoreData];
        }
        
        self.dataArray = objArray;
        self.dataSource_t.dataArray = self.dataArray;

        
        [self.tableView reloadData];
        
    } WithFailureBlock:^(id objc) {
        
    }];
    [hvm getDataWithIsHeaderRefresh:YES];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [hvm getDataWithIsHeaderRefresh:YES];
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [hvm getDataWithIsHeaderRefresh:NO];
    }];
    
}
#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeModel *hm = [self.dataArray objectAtIndex:indexPath.row];
    HomeViewModel *hvm = [[HomeViewModel alloc]init];
    [hvm GotoDetailWithModel:hm andVC:self];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0f;
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
