//
//  HomeViewModel.h
//  ZQ_MVVM
//
//  Created by colorPen on 15/6/29.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import "ViewModelClass.h"
#import "HomeModel.h"
#import <UIKit/UIKit.h>

/**
 *  ViewModelClass的子类
 *  与HomeVC对应的ViewModel
 */


@interface HomeViewModel : ViewModelClass

//获取数据
- (void)getDataWithIsHeaderRefresh:(BOOL)isHeaderRefresh;

//跳转到详情页
- (void)GotoDetailWithModel:(HomeModel *)publicModel andVC:(UIViewController *)superVC;

@end
