//
//  StepCell.h
//  CateDIY
//
//  Created by Yang on 15/6/17.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefectureModel.h"
@interface StepCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property(nonatomic,strong)PrefectureModel *model;
-(void)showDataWithModel:(PrefectureModel *)model;
@end
