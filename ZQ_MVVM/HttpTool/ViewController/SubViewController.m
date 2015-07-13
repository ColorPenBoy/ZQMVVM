//
//  SubViewController.m
//  ZQ_MVVM
//
//  Created by colorPen on 15/6/29.
//  Copyright (c) 2015年 colorPen. All rights reserved.
//

#import "SubViewController.h"

#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"资讯详情";

    
    NSString *urlPath = [NSString stringWithFormat:@"http://112.124.25.143:8080/EnterpriseCms/newinterface/ShowArticleContent?articleId=%@",self.hm.articleId];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    NSURL *url = [NSURL URLWithString:urlPath];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
