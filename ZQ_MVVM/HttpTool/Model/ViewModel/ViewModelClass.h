//
//  ViewModelClass.h
//  ZQ_MVVM
//
//  Created by colorPen on 15/6/29.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  ViewModel的基类
 */

typedef void(^SuccessBlock_VM)(id objc,BOOL isEnd);
typedef void(^FailureBlock_VM)(id objc);
typedef void(^NetWorkBlock_VM)(BOOL canConnectUrl);

@interface ViewModelClass : NSObject

@property (nonatomic, strong)SuccessBlock_VM successBlock;
@property (nonatomic, strong)FailureBlock_VM failureBlock;

//获取网络的链接状态
-(void) netWorkStateWithUrl: (NSString *)urlStr
        WithNetConnectBlock: (NetWorkBlock_VM)netConnectBlock ;

// 传入交互的Block块
- (void) setBlockWithSuccessBlock: (SuccessBlock_VM)successBlock
                WithFailureBlock: (FailureBlock_VM)failureBlock;
@end
