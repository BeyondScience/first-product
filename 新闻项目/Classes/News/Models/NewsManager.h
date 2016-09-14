//
//  NewsManager.h
//  新闻项目
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^CallBack)(id response, NSError *error);
@interface NewsManager : AFHTTPSessionManager

+(instancetype)shareNewsManager;

-(void)requestDataWithDictionary:(NSDictionary *)paramDict success:(CallBack)callBack;

@end
