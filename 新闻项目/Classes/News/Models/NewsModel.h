//
//  NewsModel.h
//  新闻项目
//
//  Created by qingyun on 16/8/3.
//  Copyright © 2016年 慕跃科. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "T1348647853363": [{
 "boardid": "ent2_bbs",
 "clkNum": 0,
 "digest": "网易娱乐8月3日报道网络上流传着这样一段韩国广告：韩国明星朴宝剑拍摄的一档广告中和一个叫“万里长城”的人下棋，广告中不但丑化“万里长城”，还安排了女性抽“万里长",
 "docid": "BTIF93HP00031H2L",
 "downTimes": 0,
 "id": "BTIF93HP00031H2L",
 "img": "http://cms-bucket.nosdn.127.net/d29f38c2875b42f4a61c793402d9a3da20160803171802.png",
 "imgType": 0,
 "imgsrc": "http://cms-bucket.nosdn.127.net/d29f38c2875b42f4a61c793402d9a3da20160803171802.png",
 "interest": "A",
 "lmodify": "2016-08-03 19:16:11",
 "picCount": 0,
 "program": "LMA1",
 "prompt": "成功为您推荐10条新内容",
 "ptime": "2016-08-03 17:14:01",
 "recReason": "网友热议",
 "recSource": "新闻热点",
 "recType": 0,
 "recprog": "TRANSB",
 "replyCount": 37762,
 "replyid": "BTIF93HP00031H2L",
 "source": "网易娱乐",
 "template": "normal1",
 "title": "韩国广告丑化\"万里长城\" 网友指责：居心何在？",
 "unlikeReason": ["娱乐/1", "万里长城/3", "标题党/6", "内容质量差/6", "重复、旧闻/6"],
 "upTimes": 0
	}
*/

@interface NewsModel : NSObject

//@property (nonatomic, copy) NSString *boardid;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSString *ptime;
//@property (nonatomic, copy) NSString *recSource;
//@property (nonatomic, copy) NSString *recReason;
//@property (nonatomic, assign) NSInteger replyCount;
//@property (nonatomic, copy) NSString *replyid;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *title;
//@property (nonatomic, copy) NSString *unlikeReason;
@property (nonatomic, copy) NSString *recprog;
//@property (nonatomic, copy) NSString *docid;
@property (nonatomic, copy) NSString *url_3w;

+(instancetype) modelWithDictionary:(NSDictionary *)dict;

@end
