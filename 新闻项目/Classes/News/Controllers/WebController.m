//
//  WebController.m
//  新闻项目
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "WebController.h"
#import "NewsViewController.h"
#import "NewsManager.h"

//#define URL_NEWS @"http://c.m.163.com/nc/article/headline/T1348647853363/10-20.html"

@interface WebController ()


@end

@implementation WebController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.scrollView.bounces = NO;
    [self.view addSubview:webView];
    
    NSURL *url = [NSURL URLWithString:self.strWeb];
//    NSString *str = [NSString stringWithContentsOfURL:url encoding:kCFStringEncodingUTF8 error:nil];
//    NSLog(@"%@",str);
//    [str stringByReplacingOccurrencesOfString:@"网易" withString:@"新闻一点点"];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    UIImageView *coverView = [[UIImageView alloc] init];
    [webView addSubview:coverView];
    coverView.contentMode = UIViewContentModeScaleAspectFit;
    coverView.clipsToBounds = YES;
    coverView.userInteractionEnabled = NO;
    coverView.backgroundColor = [UIColor whiteColor];
    coverView.frame = CGRectMake(0, 64, self.view.frame.size.width, 55);
}



@end
