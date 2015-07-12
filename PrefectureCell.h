//
//  PrefectureCell.h
//  CateDIY
//
//  Created by Yang on 15-6-11.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrefectureModel.h"
@interface PrefectureCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property(nonatomic,strong)PrefectureModel *model;
-(void)showDataWithModel:(PrefectureModel *)model;
@end
