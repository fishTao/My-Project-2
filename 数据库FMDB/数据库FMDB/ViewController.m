//
//  ViewController.m
//  数据库FMDB
//
//  Created by qingyun on 16/2/29.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *namefiled;
@property (weak, nonatomic) IBOutlet UITextField *priceField;
- (IBAction)insert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    //打开数据库
//    NSString *filename = [NSSearchPathForDirectoriesInDomains(NSUserDomainMask, YES), )]
//    
//    
//    
//    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)inside {
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)insert {
}
@end
