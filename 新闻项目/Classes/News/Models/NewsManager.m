//
//  NewsManager.m
//  新闻项目
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "NewsManager.h"
#import "NewsModel.h"
//#define URL_NEWS @"http://c.m.163.com/nc/article/headline/T1348647853363/10-20.html"
#define URL_NEWS @"http://icomment.ifeng.com/geti.php?pagesize=20&p=1&docurl=http%3A%2F%2Fwap.ifeng.com%2Fnews.jsp%3Faid%3D112173052&type=all"

@implementation NewsManager

+(instancetype)shareNewsManager{

    static NewsManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [NewsManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", nil];
    });
    return manager;
}

-(void)requestDataWithDictionary:(NSDictionary *)paramDict success:(CallBack)callBack{

    [[NewsManager shareNewsManager] GET:URL_NEWS parameters:paramDict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSArray *arr = responseObject[@"hottest"];
        NSLog(@"%@",responseObject);
        NSDictionary *dicthost = responseObject[@"comments"];
        NSLog(@"%@",dicthost);
        NSArray *arr = dicthost[@"hottest"];
        NSLog(@"%@",arr);
        NSMutableArray *muarr = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            NewsModel *model = [NewsModel modelWithDictionary:dict];
            [muarr addObject:model];
        }
//        callBack(muarr,nil);
        callBack(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        callBack(nil,error);
    }];
}

@end
