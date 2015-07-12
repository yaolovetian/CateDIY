//
//  AppModel.h
//  CateDIY
//
//  Created by Yang on 15/6/15.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppModel : NSObject
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
-(id)valueForUndefinedKey:(NSString *)key;
@end
