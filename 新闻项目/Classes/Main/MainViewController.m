//
//  ViewController.m
//  新闻项目
//
//  Created by qingyun on 16/7/13.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "MainViewController.h"
#import "ProfileViewController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];

}

/** 加载默认设置和UI */
- (void)loadDefaultSetting {
    
//    NewsViewController *vcNews = [NewsViewController new];
//    [self addViewController:vcNews imageName:@"News_icon" title:@"新闻"];
    
    VideoViewController *vcVideo = [VideoViewController new];
    [self addViewController:vcVideo imageName:@"Video_icon" title:@"视频"];
    
    ProfileViewController *vcProfile = [ProfileViewController new];
    [self addViewController:vcProfile imageName:@"icon_profile" title:@"我"];
    
}

- (void)addViewController:(UIViewController *)viewController imageName:(NSString *)imageName title:(NSString *)title {
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", imageName]];
    //viewController.tabBarItem.title = title;
    viewController.title = title;
    viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    // 创建一个导航控制器
    UINavigationController *vcNav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    // 把导航控制器添加到TanBarController中
    [self addChildViewController:vcNav];
}


@end
