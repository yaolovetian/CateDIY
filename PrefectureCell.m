//
//  PrefectureCell.m
//  CateDIY
//
//  Created by Yang on 15-6-11.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "PrefectureCell.h"
#import "UIImageView+WebCache.h"
@implementation PrefectureCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(void)showDataWithModel:(PrefectureModel *)model{
    self.model=model;
    self.titleLabel.text=model.title;
    self.messageLabel.text=model.message;
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:model.cover] placeholderImage:nil];
}
@end
