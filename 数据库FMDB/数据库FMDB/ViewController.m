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
//数据库实例对象
@property (nonatomic,assign) sqlite3 *db;

- (IBAction)insert;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //打开数据库.连接数据库
   NSString *filename = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingString:@"shops.sqlite"];
    //如果数据库文件不存在，系统会自己创建数据库，并初始化。
    
  
    int status = sqlite3_open(filename.UTF8String, &_db);
    if (status == SQLITE_OK) {//打开数据库成功
        NSLog(@"打开数据库成功");
        const char *sql = "CREATE TABLE IF NOT EXISTS T_shop (id intager PRIMARY KEY,name text NOT NULL,price,real)";
        char *errmsg = NULL;
        sqlite3_exec(self.db, sql, NULL, NULL, &errmsg);
        if (errmsg) {
            NSLog(@"创表失败---%s",errmsg);
        }
        
    }else{//打开失败
        NSLog(@"打开数据库失败");
    
    }
    
//
//    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)insert {
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO t_shops(name,price) VALUES('%@',%f);",self.namefiled.text,self.priceField.text.doubleValue];
    sqlite3_exec(self.db, sql.UTF8String, NULL, NULL, NULL);

}
@end
