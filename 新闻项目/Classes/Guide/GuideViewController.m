//
//  GuideViewController.m
//  新闻项目
//
//  Created by qingyun on 16/7/15.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "GuideViewController.h"
#import "AppDelegate.h"
@interface GuideViewController ()

@property (nonatomic, copy) NSArray *arrImages;
@property (nonatomic, weak) UIScrollView *scrollView;

@end
                                                                                 
@implementation GuideViewController

-(NSArray *)arrImages{
    if (!_arrImages) {
        NSInteger count = 4;
        NSMutableArray *arrMImages = [NSMutableArray arrayWithCapacity:count];
        for (NSInteger index = 0; index < count; index++) {
            NSString *strImageNames = [NSString stringWithFormat:@"%02ld.jpg",(long)index];
            [arrMImages addObject:strImageNames];
        }
        _arrImages = [arrMImages copy];
    }
    return _arrImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadDefaultSetting];
}

/**  加载默认设置 */
-(void)loadDefaultSetting {
    
    // 创建scrollView
    NSInteger count = 4;
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat viewHeight = self.view.frame.size.height;
    UIScrollView *scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    scrollView.frame = self.view.bounds;
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(count * viewWidth, 0);
    self.scrollView = scrollView;
    
    //给scrollView 添加图片
    for (NSInteger index = 0; index < count; index++) {
        UIImageView *imgView = [UIImageView new];
        [scrollView addSubview:imgView];
        imgView.image = [UIImage imageNamed:self.arrImages[index]];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.frame = CGRectMake(viewWidth * index, 0, viewWidth, viewHeight);
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        if (index == count - 1) {
            [self loadReadBtn:imgView];
        }
    }
    
}

-(void)loadReadBtn:(UIImageView *)imgView{

    UIButton *btnRead = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRead setTitle:@"Read" forState:UIControlStateNormal];
    [btnRead setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    btnRead.titleLabel.font = [UIFont italicSystemFontOfSize:40];
    btnRead.titleLabel.font = [UIFont systemFontOfSize:40 weight:1.3];
    btnRead.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:btnRead];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat btnWidth = 150;
    CGFloat btnX = CGRectGetMaxX(imgView.frame) - width + 0.5 * (width - btnWidth);
    CGFloat btnY = height - 100;
    btnRead.frame = CGRectMake(btnX, btnY, btnWidth, 80);

    [btnRead addTarget:self action:@selector(tapReadAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)tapReadAction{

    /**
     *  1. 保存版本号
     */
    NSString *strVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
    [[NSUserDefaults standardUserDefaults] setObject:strVersion forKey:@"oldVersionKey"];
    [[NSUserDefaults standardUserDefaults] synchronize];//强制现在就写入plist
    
    //跳转
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    [delegate loadMainController];
}

@end
