//
//  VideoModel.m
//  新闻项目
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

+(instancetype)modelWithDict:(NSDictionary *)dict{

    VideoModel *model = [[VideoModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

    if ([key isEqualToString:@"description"]) {

        [self setValue:value forKey:@"desc"];
        
    }
}

@end
