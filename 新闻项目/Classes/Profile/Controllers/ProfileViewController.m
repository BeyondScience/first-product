//
//  ProfileViewController.m
//  新闻项目
//
//  Created by qingyun on 16/8/9.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "ProfileViewController.h"
#import "SecondCell.h"

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface ProfileViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, assign) BOOL isOk;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = self.view.bounds;
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    tableView.scrollEnabled = NO;
//    tableView.separatorStyle = UITableViewStylePlain;
//    self.tabBarController.tabBar.hidden = YES;
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    if (indexPath.section == 0) {
        UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"FirstCell" owner:nil options:nil] firstObject];
        cell.frame = CGRectMake(0, 0, kWidth, 200);
        tableView.rowHeight = 200;
        return  cell;
    }
    else if(indexPath.section == 1){
        
        tableView.rowHeight = 80;
        __weak ProfileViewController *tempVC = self;
        SecondCell *cell = [SecondCell cellWithTableView:tableView];
        [cell setBlkSwitchDidAction:^(BOOL isOn) {
            tempVC.isOk = isOn;
            if (self.isOk) {
                tempVC.tabBarController.view.alpha = 0.4;
            }else{
                tempVC.tabBarController.view.alpha = 1;
            }
        }];
        return cell;
    }
    
        UITableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ForthCell" owner:nil options:nil] firstObject];
        cell.frame = CGRectMake(0, 0, kWidth, 80);
    
        return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"新闻资讯" message:@"本APP所收集的部分公开资料来源于互联网，转载的目的在于传递更多信息及用于网络分享，并不代表本站赞同其观点和对其真实性负责，也不构成任何其他建议。如果您发现网站上有侵犯您的知识产权的作品，请与我们取得联系，我们会及时修改或删除。" preferredStyle:1];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:0 handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }else if(indexPath.section == 2){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"新闻资讯" message:@"©版权归属开发者所有,更多精彩,敬请期待!" preferredStyle:1];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:0 handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
