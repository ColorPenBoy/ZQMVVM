//
//  ViewModelClass.m
//  ZQ_MVVM
//
//  Created by colorPen on 15/6/29.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import "ViewModelClass.h"
#import "HXH_DownLoad.h"

@implementation ViewModelClass

-(void) netWorkStateWithUrl: (NSString *)urlStr WithNetConnectBlock: (NetWorkBlock_VM)netConnectBlock ;
{
    BOOL netState = [HXH_DownLoad netWorkReachabilityWithURLString:urlStr];
    netConnectBlock(netState);
}
- (void)setBlockWithSuccessBlock:(SuccessBlock_VM)successBlock WithFailureBlock:(FailureBlock_VM)failureBlock
{
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
}

@end
