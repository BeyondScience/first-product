//
//  NewsViewController.m
//  新闻项目
//
//  Created by qingyun on 16/7/13.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsCell.h"
#import "NewsManager.h"
#import "WebController.h"
#import "MJRefresh.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefreshGifHeader.h"



@interface NewsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic ,copy) NSArray *arrNews;


@end

@implementation NewsViewController

-(NSArray *)arrNews{

    if (!_arrNews) {
        [[NewsManager shareNewsManager] requestDataWithDictionary:nil success:^(id response, NSError *error) {
            if (response) {
                NSLog(@"response...%@",response);
                _arrNews = response;
//                NSLog(@"response...%@",_arrNews);
                [self.tableView reloadData];
            }
        }];
    }
    return _arrNews;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 120;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
//    NSArray *idleImages = [NSArray arrayWithObject:[UIImage imageNamed:@"dropdown_loading_01"]];
//    NSArray *pullingImages = [NSArray arrayWithObject:@"dropdown_anim__0001"];
//    NSMutableArray *muarrImages = [NSMutableArray arrayWithCapacity:60];
//    for (NSInteger index = 1; index < 61; index++) {
//        NSString *strImage = [NSString stringWithFormat:@"dropdown_anim__000%ld",index];
//        UIImage *imgName = [UIImage imageNamed:strImage];
//        [muarrImages addObject:imgName];
//    }
//    NSArray *refreshImages = [muarrImages copy];
    
//    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
//    self.tableView.mj_header = header;
//    [header setImages:idleImages forState:MJRefreshStateIdle];
//    [header setImages:pullingImages forState:MJRefreshStatePulling];
//    [header setImages:refreshImages forState:MJRefreshStateRefreshing];
}

-(void)refresh{
    
    NSLog(@"shuaxin");
    [self.tableView.mj_header endRefreshing];
    
}

-(void)loadMore{

    NSLog(@"加载更多");
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}

#pragma mark -<UITableViewDataSource>

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.arrNews.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsCell *cell = [NewsCell cellWithTableView:tableView];
    cell.model = self.arrNews[indexPath.section];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    WebController *vcWeb = [WebController new];
    NewsModel *model = self.arrNews[indexPath.section];
    if (model.url_3w) {
        NSString *str = model.url_3w;
        vcWeb.strWeb = str;
//        [self.navigationController pushViewController:vcWeb animated:YES];
    }else{
//        NSString *str = @"http://www.baidu.com";
        NSString *str = @"http://news.163.com";
        vcWeb.strWeb = str;
        NSLog(@"数据丢失");
    }
    [self.navigationController pushViewController:vcWeb animated:YES];
}

@end
