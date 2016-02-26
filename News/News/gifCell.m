//
//  gifCell.m
//  News
//
//  Created by qingyun on 16/1/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "gifCell.h"
#import "UIImageView+WebCache.h"
@implementation gifCell



-(void)setDic:(NSDictionary *)dic{
    
    self.title.text=dic[@"title"];
    self.name.text = dic[@"author"][@"name"];
    
    
    NSString *string =dic[@"gif"][0][@"pic"];
    NSArray *arr =  [string componentsSeparatedByString:@"!"];
    NSURL *url = arr[0];

    [self.gif sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"加载1.gif"]];

//    [self.gif sd_setImageWithURL:url];
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
