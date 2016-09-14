//
//  VideoCell.m
//  新闻项目
//
//  Created by qingyun on 16/7/16.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "VideoCell.h"
#import "UIImageView+WebCache.h"
@interface VideoCell()
{
    __weak IBOutlet UILabel *_lblTime;
    __weak IBOutlet UIImageView *_imgViewBig;
    __weak IBOutlet UIImageView *_imgViewSmall;
    __weak IBOutlet UILabel *_lblName;
    __weak IBOutlet UILabel *lblTitle;
}

@end

@implementation VideoCell

-(void)setModel:(VideoModel *)model{

    _model = model;
    lblTitle.text = model.title;
    _lblName.text = model.topicName;
    _lblTime.text = model.ptime;
    NSURL *url = [NSURL URLWithString:model.cover];
    [_imgViewBig sd_setImageWithURL:url];
    NSURL *urlSmall = [NSURL URLWithString:model.sectiontitle];
    [_imgViewSmall sd_setImageWithURL:urlSmall];
}

+(instancetype)cellWithTableView:(UITableView *)tableView{

    static NSString *strCell = @"VideoCell";
    VideoCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
//    cell.backgroundColor = [UIColor orangeColor];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"VideoCell" owner:nil options:nil]firstObject];
    }
    return cell;
}

@end
