//
//  Define.h
//  CateDIY
//
//  Created by Yang on 15-6-10.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#ifndef CateDIY_Define_h
#define CateDIY_Define_h

#import "LZXHelper.h"

//推荐界面
#define kRecommendUrl @"http://api.2meiwei.com/v1/index/index/"
#define kRecommendTwoUrl @"http://api.2meiwei.com/v1/shicai/ingredient/?type=ingredient&id=%@&idx=%ld&size=10"

//详情界面
#define kThirdUrl @"http://api.2meiwei.com/v1/recipe/%@/"

//专区界面
#define kPrefectureUrl @"http://api.2meiwei.com/v1/collect/list/?idx=%ld&type=5&size=10"
#define kPrefectureTwoUrl @"http://api.2meiwei.com/v1/collect/%@/?idx=%d&id=%@&size=10"
//专区头视图
#define kTopHeadPrefectureUrl @"http://api.2meiwei.com/v1/collect/recommend/"

//发现搜索接口
#define kFindUrl @"http://api.2meiwei.com/v1/recipe/search/?idx=%ld&key=%@&size=10"

#endif
