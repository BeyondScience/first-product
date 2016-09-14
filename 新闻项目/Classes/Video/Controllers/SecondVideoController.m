//
//  SecondVideoController.m
//  新闻项目
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "SecondVideoController.h"

@interface SecondVideoController ()


@property (nonatomic, strong) AVPlayerViewController *vcAV;

@end

@implementation SecondVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
     
     
     self.vcAV = [[AVPlayerViewController alloc] init];
     
     AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:self.strUrl]];
     self.vcAV.player = player;
     self.vcAV.videoGravity = AVLayerVideoGravityResizeAspect;
     [self.vcAV.player play];
     [self presentViewController:self.vcAV animated:YES completion:^{
        NSLog(@"开始播放");
     }];
     
     self.vcAV.view.frame = CGRectMake(20, 20, 200, 300);
     [self.view addSubview:self.vcAV.view];
}


@end
