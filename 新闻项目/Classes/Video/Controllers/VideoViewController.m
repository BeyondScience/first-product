//
//  VideoViewController.m
//  新闻项目
//
//  Created by qingyun on 16/7/13.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoCell.h"
#import "AFNetworking.h"
#import "VideoModel.h"
#import "SecondVideoController.h"
#import "MJRefresh.h"
#define APIURL @"http://c.3g.163.com/recommend/getChanListNews?channel=T1457068979049&passport=86Gf2Swg4vpfc3q74j018HjwStHTbMnr8pc6fFfTjog%3D&devId=VhQzsNeovUfecce5ae1XvJR4oda7GoRFIurBVIvOZbCk3hTbMqu%2BnCW%2F912OPhQN&size=10&version=11.0&spever=false&net=wifi&lat=&lon=&ts=1470186285&sign=d9DnsdSuEm6jzQLs8qg1mQ%2FB6qzesj8uZ3CUyp4HZu948ErR02zJ6%2FKXOnxX046I&encryption=1&canal=appstore"

@interface VideoViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, copy) NSArray *arrDatas;

@end

@implementation VideoViewController

-(NSArray *)arrDatas{
    if (!_arrDatas) {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
        
        [manager GET:APIURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            NSLog(@"%@",responseObject);
            NSArray *data = responseObject[@"视频"];
            NSMutableArray *muarr = [NSMutableArray array];
            for (NSDictionary *dict in data) {
                VideoModel *model = [VideoModel modelWithDict:dict];
                [muarr addObject:model];
            }
            _arrDatas = [muarr copy];
            [self.tableView reloadData];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
    }
    return _arrDatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.bounds;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.separatorStyle = UITableViewStylePlain;
    tableView.dataSource = self;
    tableView.delegate = self;
//    tableView.backgroundColor = [UIColor orangeColor];
    [self loadDefaultSetting];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMore)];
}

-(void)refresh{

    [self.tableView.mj_header endRefreshing];
    
}

-(void)loadMore{

    [self.tableView.mj_footer endRefreshing];
}
/**  加载默认设置 */
-(void)loadDefaultSetting {
    self.tableView.rowHeight = 227;
    
}

#pragma mark UITableViewDataSource && UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrDatas.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    VideoCell *cell = [VideoCell cellWithTableView:tableView];
    cell.model = self.arrDatas[indexPath.section];
    
    
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"%ld--%ld",(long)indexPath.section,(long)indexPath.row);
    VideoModel *model = self.arrDatas[indexPath.section];
    
    SecondVideoController *vcSecond = [SecondVideoController new];
   vcSecond.strUrl =  model.mp4_url;
    [self.navigationController pushViewController:vcSecond animated:YES];
}
@end
