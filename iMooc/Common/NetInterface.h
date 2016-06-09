//
//  NetInterface.h
//  11111
//
//  Created by qianfeng on 16/5/18.
//  Copyright © 2016年 Loser_Su. All rights reserved.
//

#ifndef NetInterface_h
#define NetInterface_h

/**
 *  分类
 */
// http://www.imooc.com/api3/newcourseskill/token=0a1b7dc4a13ff17db61048ab50bb5509&uid=0

// 分类各项
// http://www.imooc.com/api3/courselist_ver2/all_type=1&cat_type=7&easy_type=0&page=1&sort_type=0&token=7f75e24cb1f7e5c358f03a7b40a60976&uid=0

//#define CLASSIFY_EVERY_URL @"http://www.imooc.com/api3/courselist_ver2/all_type=1&cat_type=%d(每个小类的id)&easy_type=0(每个分类里的难度等级)&page=%d(页数)&sort_type=0&token=7f75e24cb1f7e5c358f03a7b40a60976&uid=0"

#define CLASSIFY_EVERY_URL @"http://www.imooc.com/api3/courselist_ver2/all_type=1&cat_type=%d&easy_type=%d&page=%d&sort_type=0&token=7f75e24cb1f7e5c358f03a7b40a60976&uid=0"

// 各分级界面
#define CLASSIFY_EVERY_RANK_URL @"http://www.imooc.com/api3/courselist_ver2/all_type=1&cat_type=%d&easy_type=%d&page=%d&sort_type=0&token=7f75e24cb1f7e5c358f03a7b40a60976&uid=0"


/**
 *  课程界面
 */

// 主界面
// http://www.imooc.com/api3/courselist_ver2/cat_type=0&easy_type=0&page=1&sort_type=0&token=7f75e24cb1f7e5c358f03a7b40a60976&uid=0

#define COURSE_URL @"http://www.imooc.com/api3/courselist_ver2/cat_type=0&easy_type=0&page=%d&sort_type=0&token=7f75e24cb1f7e5c358f03a7b40a60976&uid=0"



/**
 *  发现界面
 */

/****** 文章 ******/
// 全部
// http://www.imooc.com/api3/articlelist/page=1&token=aec1e1fe6da2e8a4ba9d7b725d851f57&uid=0

#define FIND_ARTICLE_QB_URL @"http://www.imooc.com/api3/articlelist/page=%d&token=aec1e1fe6da2e8a4ba9d7b725d851f57&uid=0"

// 前端开发
// http://www.imooc.com/api3/articlelist/page=1&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=105&uid=0

#define FIND_ARTICLE_QDKF_URL @"http://www.imooc.com/api3/articlelist/page=%d&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=105&uid=0"

// 后端开发
// http://www.imooc.com/api3/articlelist/page=1&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=106&uid=0

#define FIND_ARTICLE_HDKF_URL @"http://www.imooc.com/api3/articlelist/page=%d&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=106&uid=0"

// 职场生活
// http://www.imooc.com/api3/articlelist/page=1&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=107&uid=0

#define FIND_ARTICLE_ZCSH_URL @"http://www.imooc.com/api3/articlelist/page=%d&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=107&uid=0"

// 设计
// http://www.imooc.com/api3/articlelist/page=1&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=109&uid=0

#define FIND_ARTICLE_SJ_URL @"http://www.imooc.com/api3/articlelist/page=%d&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=109&uid=0"

// 移动开发
// http://www.imooc.com/api3/articlelist/page=1&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=110&uid=0

#define FIND_ARTICLE_YDKF_URL @"http://www.imooc.com/api3/articlelist/page=%d&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=110&uid=0"

// 其他类干货
// http://www.imooc.com/api3/articlelist/page=1&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=114&uid=0

#define FIND_ARTICLE_GH_URL @"http://www.imooc.com/api3/articlelist/page=%d&token=aec1e1fe6da2e8a4ba9d7b725d851f57&typeid=114&uid=0"


/****** 猿问 ******/
// 推荐
// http://www.imooc.com/api3/getrecommend/page=1&token=1c34f7babe1f2bf4b40235b35bd9ae61&type=recommend&uid=0

#define FIND_QUESTION_TJ_URL @"http://www.imooc.com/api3/getrecommend/page=%d&token=1c34f7babe1f2bf4b40235b35bd9ae61&type=recommend&uid=0"

// 最新
// http://www.imooc.com/api3/getrecommend/page=1&token=1c34f7babe1f2bf4b40235b35bd9ae61&type=new&uid=0

#define FIND_QUESTION_ZX_URL @"http://www.imooc.com/api3/getrecommend/page=%d&token=1c34f7babe1f2bf4b40235b35bd9ae61&type=new&uid=0"

// 等待回答
// http://www.imooc.com/api3/getrecommend/page=1&token=1c34f7babe1f2bf4b40235b35bd9ae61&type=waitreply&uid=0

#define FIND_QUESTION_DDHD_URL @"http://www.imooc.com/api3/getrecommend/page=%d&token=1c34f7babe1f2bf4b40235b35bd9ae61&type=waitreply&uid=0"











#endif /* NetInterface_h */
