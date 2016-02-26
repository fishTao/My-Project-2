//
//  NewsCell.m
//  News
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NewsCell.h"
#import "UIImageView+WebCache.h"
@implementation NewsCell


-(void)setDic:(NSDictionary *)dic{

    NSString *string =dic[@"pic"];
    NSArray *arr =  [string componentsSeparatedByString:@"!"];
    NSURL *url = arr[0];
    [self.img sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"加载1.gif"]];

    self.name.text=dic[@"author"][@"name"];
    self.title.text=dic[@"title"];

    NSInteger read = [dic[@"readnum"] integerValue];
    self.read.text = [NSString stringWithFormat:@"阅读%ld",read];

    NSInteger reply = [dic [@"replynum"]integerValue];
    self.reply.text = [NSString stringWithFormat:@"弹幕%ld",reply];
    
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
