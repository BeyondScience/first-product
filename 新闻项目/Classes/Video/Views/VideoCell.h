//
//  VideoCell.h
//  新闻项目
//
//  Created by qingyun on 16/7/16.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"

@interface VideoCell : UITableViewCell
@property (nonatomic, strong) VideoModel *model;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
