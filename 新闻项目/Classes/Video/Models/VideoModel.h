//
//  VideoModel.h
//  新闻项目
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

/*{
    "cover": "http://vimg1.ws.126.net/image/snapshot/2016/8/4/T/VBSII114T.jpg",
    "description": "小宝宝犯困把哈士奇给扑倒了。。。二哈原来这么暖~",
    "length": 26,
    "m3u8_url": "http:flv2.bn.netease.com/tvmrepo/2016/8/O/U/EBSI6VJOU/SD/movie_index.m3u8",
    "mp4_url": "http:flv2.bn.netease.com/tvmrepo/2016/8/O/U/EBSI6VJOU/SD/EBSI6VJOU-mobile.mp4",
    "playCount": 4985,
    "playersize": 1,
    "prompt": "成功为您推荐10条新视频",
    "ptime": "2016-08-02 21:40:07.0",
    "replyBoard": "video_bbs",
    "replyCount": 0,
    "replyid": "BSI6VND7008535RB",
    "sectiontitle": "http://vimg3.ws.126.net/image/snapshot/2016/5/O/1/VBLSFHCO1.jpg",
    "title": "小宝宝犯困把哈士奇给扑倒了 二哈原来这么暖",
    "topicDesc": "每天分享萌娃和萌宠的趣闻！",
    "topicImg": "http://vimg3.ws.126.net/image/snapshot/2016/5/O/1/VBLSFHCO1.jpg",
    "topicName": "萌宠与萌娃的那些事",
    "topicSid": "VBLSFHCNU",
    "vid": "VBSI6VND7",
    "videoTopic": {
        "alias": "每天分享萌娃和萌宠的趣闻！",
        "ename": "T1463108931942",
        "tid": "T1463108931942",
        "tname": "萌宠与萌娃的那些事"
    },
    "videosource": "新媒体"
}
 */

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *desc;
@property (nonatomic, assign) NSInteger playCount;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *sectiontitle;
@property (nonatomic, copy) NSString *topicName;
@property (nonatomic, copy) NSString *mp4_url;
@property (nonatomic, copy) NSString *title;

+(instancetype)modelWithDict:(NSDictionary *)dict;

@end
