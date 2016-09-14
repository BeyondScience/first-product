//
//  NewsCell.h
//  新闻项目
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"

@interface NewsCell : UITableViewCell

@property (nonatomic, strong) NewsModel *model;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
