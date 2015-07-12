//
//  RecommendCell.m
//  CateDIY
//
//  Created by Yang on 15-6-10.
//  Copyright (c) 2015年 MoYang. All rights reserved.
//

#import "RecommendCell.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
@implementation RecommendCell

- (void)awakeFromNib {
    self.selectionStyle=UITableViewCellSelectionStyleNone;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
-(void)showDataWiteModel:(PrefectureModel *)model{
    self.contentText.editable=NO;
    self.contentText.showsVerticalScrollIndicator=NO;
    self.model=model;
    self.titleLabel.text=model.title;
    self.contentText.text=model.content;
    [self.PictureImageView sd_setImageWithURL:[NSURL URLWithString:model.pcover] placeholderImage:nil];
}

@end
