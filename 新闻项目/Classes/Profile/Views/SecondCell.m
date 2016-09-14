//
//  SecondCell.m
//  新闻项目
//
//  Created by qingyun on 16/8/9.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "SecondCell.h"

@implementation SecondCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *strCell2 = @"cell2";
    SecondCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell2];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SecondCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (IBAction)switchAction:(id)sender {
    _isOn = !_isOn;
    self.blkSwitchDidAction(_isOn);
}

@end
