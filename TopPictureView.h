//
//  TopPictureView.h
//  CateDIY
//
//  Created by Yang on 15/6/17.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopPictureView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property(nonatomic,copy)NSString *picture;
-(void)creatTopPictureWith:(NSString *)topPicture;
@end
