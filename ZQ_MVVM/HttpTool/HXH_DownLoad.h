//
//  HXH_DownLoad.h
//  ZQ_HttpRequest_Demo
//
//  Created by 张强 on 15/3/13.
//  Copyright (c) 2015年 张强. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DownLoadSuccessBlock)(id response);
typedef void(^DownLoadFailureBlock)(NSError *error);

@interface HXH_DownLoad : NSObject

/**
 *  检测网络可链接性
 */
+ (BOOL) netWorkReachabilityWithURLString:(NSString *)strUrl;

/**
 *  Get
 */
+ (void)getWithUrl:(NSString *)baseUrl
         paramDict:(NSDictionary *)dict
      successBlock:(DownLoadSuccessBlock)GetSuccess
      failureBlock:(DownLoadFailureBlock)GetFailure;
/**
 *  Post
 */
+ (void)postWithUrl:(NSString *)baseUrl
          paramDict:(NSDictionary *)dict
       successBlock:(DownLoadSuccessBlock)success
       failureBlock:(DownLoadFailureBlock)failure;
/**
 *  Put
 */
+ (void)putWithUrl:(NSString *)baseUrl
         paramDict:(NSDictionary *)dict
      successBlock:(DownLoadSuccessBlock)success
      failureBlock:(DownLoadFailureBlock)failure;
/**
 *  Delete
 */
+ (void)deleteWithUrl:(NSString *)baseUrl
            paramDict:(NSDictionary *)dict
         successBlock:(DownLoadSuccessBlock)success
         failureBlock:(DownLoadFailureBlock)failure;


@end
