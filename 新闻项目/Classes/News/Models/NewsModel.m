//
//  NewsModel.m
//  新闻项目
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

/*
 
 @property (nonatomic, copy) NSString *digest;
 @property (nonatomic, copy) NSString *ID;
 @property (nonatomic, copy) NSString *img;
 @property (nonatomic, copy) NSString *ptime;
 @property (nonatomic, copy) NSString *recSource;
 @property (nonatomic, copy) NSString *recReason;
 @property (nonatomic, assign) NSInteger replyCount;
 @property (nonatomic, copy) NSString *replyid;
 @property (nonatomic, copy) NSString *source;
 @property (nonatomic, copy) NSString *title;
 @property (nonatomic, copy) NSString *unlikeReason;

 */

+(instancetype)modelWithDictionary:(NSDictionary *)dict{

    NewsModel *model = [[NewsModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

//    NSLog(@">>>>>>>>%@",key);
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"ID"];
    }
}


@end
