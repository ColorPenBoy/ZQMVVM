




//
//  HXH_DownLoadManager.m
//  ZQ_HttpRequest_Demo
//
//  Created by 张强 on 15/3/13.
//  Copyright (c) 2015年 张强. All rights reserved.
//

#import "HXH_DownLoadManager.h"

#import "Reachability.h"

#import "HXH_DownLoad.h"

//g_NetIsOnline - 有网络连接状态
#define g_NetIsOnline !([Reachability reachabilityForInternetConnection].currentReachabilityStatus==NotReachable)

@implementation HXH_DownLoadManager

+ (HXH_DownLoadManager *)shareManager
{
    static HXH_DownLoadManager *manager = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)hxh_HttpRequestWithUrl:(NSString *)baseUrl
                  andParamDict:(NSDictionary *)paramDict
            andHttpRequestType:(HttpRequestType)requestType
               andSuccessBlock:(SuccessBlock)success
               andFailureBlock:(FailureBlock)failure
{
    
    switch (requestType)
    {
        case HttpRequestTypeGet:
        {
            [HXH_DownLoad getWithUrl:baseUrl paramDict:paramDict successBlock:success failureBlock:failure];
        }
            break;
        case HttpRequestTypePost:
        {
            //给所有接口加密
            [HXH_DownLoad postWithUrl:baseUrl paramDict:paramDict successBlock:success failureBlock:failure];
        }
            break;
        
        case HttpRequestTypePut:
        {
            [HXH_DownLoad putWithUrl:baseUrl paramDict:paramDict successBlock:success failureBlock:failure];
        }
            break;
        case HttpRequestTypeDelete:
        {
            [HXH_DownLoad deleteWithUrl:baseUrl paramDict:paramDict successBlock:success failureBlock:failure];
        }
            break;
        default:
            break;
    }
    
}

@end
