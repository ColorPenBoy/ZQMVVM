//
//  HomeViewModel.m
//  ZQ_MVVM
//
//  Created by colorPen on 15/6/29.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import "HomeViewModel.h"

#import "HXH_DownLoadManager.h"

#import "HomeModel.h"

#import "SubViewController.h"

#define PAGESIZE 10


@interface HomeViewModel()

@property (nonatomic, assign)NSInteger page;
@property (nonatomic, strong)__block NSMutableArray *dataArray;

@end

@implementation HomeViewModel
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.page = 1;
        self.dataArray = [[NSMutableArray alloc]init];
    }
    return self;
}
- (void)getDataWithIsHeaderRefresh:(BOOL)isHeaderRefresh
{
    if (isHeaderRefresh)
    {
        self.page = 1;
        [self HttpRequestDataWithIsHeaderRefresh:YES andPage:self.page];
    }
    else
    {
        self.page++;
        [self HttpRequestDataWithIsHeaderRefresh:NO andPage:self.page];
    }
}

- (void)HttpRequestDataWithIsHeaderRefresh:(BOOL)isHeaderRefresh andPage:(NSInteger)page
{    
    NSString *baseUrl = @"http://112.124.25.143:8080/EnterpriseCms/newinterface/GetArticles";
    NSDictionary *param = @{@"currentPage":[NSString stringWithFormat:@"%ld",(unsigned long)page],
                            @"merchantId":@"67B5405C-6CBE-46FB-BE0A-0DAB5EB8B22F",
                            @"pageSize":[NSString stringWithFormat:@"%d",PAGESIZE]};
    
    NSLog(@"url_%@_%@",baseUrl,param);
    
    [[HXH_DownLoadManager shareManager] hxh_HttpRequestWithUrl:baseUrl andParamDict:param andHttpRequestType:HttpRequestTypeGet andSuccessBlock:^(id response) {
        
        //对从后台获取的数据进行处理，然后传给ViewController层进行显示
        if (isHeaderRefresh)
        {
            self.dataArray = [HomeModel GetModelFromRequestData:response];
            
            self.successBlock(self.dataArray,NO);
        }
        else
        {
            [self.dataArray addObjectsFromArray:[HomeModel GetModelFromRequestData:response]];
            NSLog(@"数组长度__%ld",[self.dataArray count]);
            if ([[HomeModel GetModelFromRequestData:response] count] < PAGESIZE)
            {
                self.successBlock(self.dataArray, YES);
            }
            else
            {
                self.successBlock(self.dataArray,NO);
            }
        }
        
    } andFailureBlock:^(NSError *error) {
        
        self.failureBlock(error);
        
    }];
}


/**
 *  去往下级界面
 *
 *  @param publicModel 下级界面所需数据源模型
 *  @param superVC     当前VC————用于跳转
 */
- (void)GotoDetailWithModel:(HomeModel *)publicModel andVC:(UIViewController *)superVC
{
    SubViewController *sVC = [[SubViewController alloc]init];
    sVC.hm = publicModel;
    [superVC.navigationController pushViewController:sVC animated:YES];
}

@end
