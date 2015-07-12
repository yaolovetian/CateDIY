//
//  PrefectureModel.h
//  CateDIY
//
//  Created by Yang on 15/6/15.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "AppModel.h"

@interface PrefectureModel : AppModel
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,copy)NSString *id;
@property(nonatomic,copy)NSString *cover;
@property(nonatomic,copy)NSString *pcover;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *objid;
@property(nonatomic,copy)NSDictionary *ingredient1;
@property(nonatomic,copy)NSString *note;
@property(nonatomic,copy)NSString *pic;
@property(nonatomic,strong)NSNumber *idx;
@end
