//
//  StepCell.m
//  CateDIY
//
//  Created by Yang on 15/6/17.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "StepCell.h"
#import "UIImageView+WebCache.h"
@implementation StepCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(void)showDataWithModel:(PrefectureModel *)model{
    self.noteTextView.editable=NO;
    self.model=model;
    self.numberLabel.text=[model.idx stringValue];
    self.noteTextView.text=model.note;
    [self.pictureImageView sd_setImageWithURL:[NSURL URLWithString:model.pic]];
}
@end
