//
//  NewsCell.m
//  News
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell


-(void)setDic:(NSDictionary *)dic{

    
    self.titleLabel.text=dic[@"title"];
    self.areaLabel.text=dic[@"community"];
    self.quLabel.text=dic[@"simpleadd"];
    self.typeLabel.text=dic[@"housetype"];
    NSInteger price=[dic[@"price"] integerValue];
    self.priceLabel.text=[NSString stringWithFormat:@"%ld元",price];
    
    _dic=dic;
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
