//
//  mainTabBarVC.m
//  News
//
//  Created by qingyun on 16/1/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "mainTabBarVC.h"

@interface mainTabBarVC ()

@end

@implementation mainTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tabBar颜色
//    self.tabBar.tintColor = [UIColor orangeColor];
    self.tabBar.tintColor = [UIColor colorWithRed:62.0/255.0  green:114.0/255.0 blue:224.0/255.0 alpha:1.0];
    self.tabBarItem.image = [UIImage imageNamed:@"1.png"];    //设置默认显示
    self.selectedIndex = 2;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
