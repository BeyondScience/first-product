//
//  NewsViewController.h
//  新闻项目
//
//  Created by qingyun on 16/7/13.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController
@property (nonatomic, copy) void(^blkUrl)(NSString *strUrl);


@end
