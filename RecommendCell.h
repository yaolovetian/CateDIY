//
//  RecommendCell.h
//  CateDIY
//
//  Created by Yang on 15-6-10.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefectureModel.h"
@interface RecommendCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *PictureImageView;
@property (weak, nonatomic) IBOutlet UITextView *contentText;
@property (nonatomic,strong)PrefectureModel *model;
-(void)showDataWiteModel:(PrefectureModel *)model;
@end
