//
//  AppDelegate.m
//  新闻项目
//
//  Created by qingyun on 16/7/13.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "GuideViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    /**
     *  1.根据条件设置跟控制器
     *  2.提取外部版本号（从Info.plist文件中）
     *  3.读取自己上次运行的版本号 并判断两个版本号
     */
    NSString *strVersion = [[NSBundle mainBundle]objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    NSString *strVersionMine = [[NSUserDefaults standardUserDefaults] objectForKey:@"oldVersionKey"];
    if ([strVersionMine isEqualToString:strVersion]) {
        [self loadMainController];
    }else{
        GuideViewController *guideController = [GuideViewController new];
        self.window.rootViewController = guideController;
    }
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)loadMainController{

    [self.window setRootViewController:[MainViewController new]];
}

@end
