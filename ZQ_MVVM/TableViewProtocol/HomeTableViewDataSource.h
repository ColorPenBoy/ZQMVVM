//
//  HomeTableViewDataSource.h
//  ZQ_MVVM
//
//  Created by colorPen on 15/7/1.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomeTableViewDataSource : NSObject<UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray *dataArray;

@end
