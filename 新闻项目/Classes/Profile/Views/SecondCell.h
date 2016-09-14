//
//  SecondCell.h
//  新闻项目
//
//  Created by qingyun on 16/8/9.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *switchOn;
@property (nonatomic, assign) BOOL isOn;

@property (nonatomic, copy) void(^blkSwitchDidAction)(BOOL);

+(instancetype) cellWithTableView:(UITableView *)tableView;

@end
