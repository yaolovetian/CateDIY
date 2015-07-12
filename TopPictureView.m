//
//  TopPictureView.m
//  CateDIY
//
//  Created by Yang on 15/6/17.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "TopPictureView.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"
@implementation TopPictureView
- (void)awakeFromNib {
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate *appDelegate = app.delegate;
    self.picture=appDelegate.str;
    [self creatTopPictureWith:self.picture];
}
-(void)creatTopPictureWith:(NSString *)topPicture{
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:topPicture]];
}
@end
