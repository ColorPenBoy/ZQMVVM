//
//  HomeModel.h
//  ZQ_MVVM
//
//  Created by colorPen on 15/6/29.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject

/**
 *  标题
 */
@property (nonatomic,strong)NSString *title;
/**
 *  正文
 */
@property (nonatomic,strong)NSString *content;
/**
 *  图片
 */
@property (nonatomic,strong)NSString *uploadImg;
/**
 *  详情
 */
@property (nonatomic,strong)NSString *dateStr;
/**
 *  文章ID
 */
@property (nonatomic,strong)NSString *articleId;
/**
 *  是否收藏
 */
@property (nonatomic,assign)BOOL newsIsFavorite;

+ (NSMutableArray *)GetModelFromRequestData:(id)requestData;

@end
