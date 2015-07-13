//
//  HomeModel.m
//  ZQ_MVVM
//
//  Created by colorPen on 15/6/29.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import "HomeModel.h"
#import "MJExtension.h"

@implementation HomeModel

+ (NSMutableArray *)GetModelFromRequestData:(id)requestData
{
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:requestData options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    NSDictionary *contents = [rootDict objectForKey:@"contents"];
    NSArray *objectList = [contents objectForKey:@"objectList"];
    for (NSDictionary *dict in objectList)
    {
        HomeModel *nm = [[HomeModel alloc]init];
        nm.title = [dict objectForKey:@"title"];
        nm.content = [dict objectForKey:@"content"];
        nm.dateStr = [dict objectForKey:@"dateStr"];
        nm.uploadImg = [NSString stringWithFormat:@"http://112.124.25.143:8080/EnterpriseCms%@",[dict objectForKey:@"uploadImg"]];
        nm.articleId = [dict objectForKey:@"articleId"];
        nm.newsIsFavorite = NO;
        [mArray addObject:nm];
    }
    return mArray;
}

@end
