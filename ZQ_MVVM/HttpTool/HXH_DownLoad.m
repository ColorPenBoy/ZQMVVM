//
//  HXH_DownLoad.m
//  ZQ_HttpRequest_Demo
//
//  Created by 张强 on 15/3/13.
//  Copyright (c) 2015年 张强. All rights reserved.
//

#import "HXH_DownLoad.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

@implementation HXH_DownLoad


/************   监测网络的可链接性   *****/
+ (BOOL) netWorkReachabilityWithURLString:(NSString *) strUrl
{
    __block BOOL netState = NO;
    
    NSURL *baseURL = [NSURL URLWithString:strUrl];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    NSOperationQueue *operationQueue = manager.operationQueue;
    
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                [operationQueue setSuspended:NO];
                netState = YES;
                break;
            case AFNetworkReachabilityStatusNotReachable:
                netState = NO;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    
    [manager.reachabilityManager startMonitoring];
    
    return netState;
}


/******************分不同下载 - Type（只对Get请求做缓存）**********************/

/**
 *  0.Get
 */
+ (void)getWithUrl:(NSString *)baseUrl
         paramDict:(NSDictionary *)dict
      successBlock:(DownLoadSuccessBlock)GetSuccess
      failureBlock:(DownLoadFailureBlock)GetFailure
{
    //用于网络请求的一个类
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //遇到了问题 Code=-1016, 下载的数据不是json
    //  以下的解析器类型获取的数据是NSData类型的
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//   AFHTTPRequestOperation *requestOperation =
    [manager GET:baseUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
       NSHTTPURLResponse  *response = operation.response;
       if (200 == response.statusCode) {
           if (GetSuccess)
               GetSuccess(responseObject);
       } else {
           if (GetFailure)
               GetFailure(responseObject);
          
       }
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (GetFailure)
            GetFailure(error);
        
    }];
    
//    [requestOperation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
//        NSLog(@"上传 %f", (float)(totalBytesRead / totalBytesExpectedToRead));
//    }];
    
}

/**
 *  1.Post
 */
+ (void)postWithUrl:(NSString *)baseUrl
          paramDict:(NSDictionary *)dict
       successBlock:(DownLoadSuccessBlock)PostSuccess
       failureBlock:(DownLoadFailureBlock)PostFailure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

//    AFHTTPRequestOperation *requestOperation =
    [manager POST:baseUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSHTTPURLResponse  *response = operation.response;
        if (200 == response.statusCode) {
            if (PostSuccess)
                PostSuccess(responseObject);
        } else {
            if (PostFailure)
                PostFailure(responseObject);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@",error);
        
        if (PostFailure)
            PostFailure(error);
        
    }];
    
    
    
//    [requestOperation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
//        NSLog(@"上传 %f", (float)(totalBytesRead / totalBytesExpectedToRead));
//    }];
    
}
/**
 *  2.Put
 */
+ (void)putWithUrl:(NSString *)baseUrl
         paramDict:(NSDictionary *)dict
      successBlock:(DownLoadSuccessBlock)PutSuccess
      failureBlock:(DownLoadFailureBlock)PutFailure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 8;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
    [manager PUT:baseUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (PutSuccess)
            PutSuccess(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if (PutFailure)
            PutFailure(nil);
        
    }];
}
/**
 *  3.Delete
 */
+ (void)deleteWithUrl:(NSString *)baseUrl
            paramDict:(NSDictionary *)dict
         successBlock:(DownLoadSuccessBlock)DeleteSuccess
         failureBlock:(DownLoadFailureBlock)DeleteFailure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
    manager.requestSerializer.timeoutInterval = 8;
    [manager DELETE:baseUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (DeleteSuccess)
            DeleteSuccess(responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (DeleteFailure)
            DeleteFailure(nil);
    }];
   
}



@end
