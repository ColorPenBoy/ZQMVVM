//
//  HXH_DownLoadManager.h
//  ZQ_HttpRequest_Demo
//
//  Created by 张强 on 15/3/13.
//  Copyright (c) 2015年 张强. All rights reserved.
//

/**
 *  数据下载管理类
 */
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HttpRequestType) {
    
    HttpRequestTypeGet = 0,
    HttpRequestTypePost,
    HttpRequestTypePut,
    HttpRequestTypeDelete,
    HttpRequestTypeDownLoadFile,
    HttpRequestTypeUpLoadFile,
    
};

typedef void(^SuccessBlock)(id response);
typedef void(^FailureBlock)(NSError *error);

@interface HXH_DownLoadManager : NSObject

+ (HXH_DownLoadManager *)shareManager;


@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailureBlock failureBlock;

/**
 *  发送一个网络请求
 *
 *  @param baseUrl      请求路径
 *  @param paramDict    请求参数
 *  @param requestType  请求类型(Get、Post、Put、Delete)
 *  @param success      请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure      请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
- (void)hxh_HttpRequestWithUrl:(NSString *)baseUrl
                  andParamDict:(NSDictionary *)paramDict
            andHttpRequestType:(HttpRequestType)requestType
               andSuccessBlock:(SuccessBlock)success
               andFailureBlock:(FailureBlock)failure;

@end
