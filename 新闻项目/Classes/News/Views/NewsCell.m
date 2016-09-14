//
//  NewsCell.m
//  新闻项目
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+WebCache.h"

@interface NewsCell ()

{
    __weak IBOutlet UILabel *_lblTime;
    __weak IBOutlet UIImageView *_imgView;
    __weak IBOutlet UILabel *_lblname;
    __weak IBOutlet UILabel *_lbltitle;
    
    
    
}

@end

@implementation NewsCell

-(void)setModel:(NewsModel *)model{

    _model = model;
    NSURL *url = [NSURL URLWithString:model.imgsrc];
    [_imgView sd_setImageWithURL:url];
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    _lbltitle.text = model.title;
//    _lblname.text = model.source;
    _lblname.text = nil;
    _lblTime.text = model.ptime;
//    _lblTime.text = model.recprog;

}

+(instancetype)cellWithTableView:(UITableView *)tableView{

    static NSString *strCell = @"newsCell";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil] firstObject];
    }
    return cell;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
}


@end
