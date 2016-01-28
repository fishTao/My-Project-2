//
//  ViewController.m
//  News
//
//  Created by qingyun on 16/1/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "GIFController.h"
#import "gifCell.h"
#import "AFNetworking.h"
#import "Header.h"
#import "UIImageView+WebCache.h"


@interface GIFController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UITableView *myTable;

@property (nonatomic ,strong) NSMutableArray *array;
@end

@implementation GIFController


-(NSMutableArray *)array{
    if (_array == nil) {
        _array = [[NSMutableArray alloc]init];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
    //请求数据
    [self requestNews];
    
    _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _myTable.delegate = self;
    _myTable.dataSource = self;
    
    _myTable.rowHeight = 290;
    [self.view addSubview:_myTable];
    


    // Do any additional setup after loading the view.
}
//没网络时候调用此方法
-(void)error{
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    lab.text = @"加载失败，请检查网络连接...";
    lab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lab];

}
#pragma mark ==================TableView  DataSource=====================


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    gifCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"gifCell" owner:self options:nil][0];
    }
    
    cell.dic = _array[indexPath.row];
    
    return cell;
}

#pragma mark    ================网络请求======================
- (void)requestNews{
    
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    //    NSString *value=@"";
    //设置响应序列化
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    //设置参数
    //    NSDictionary *prameter=@{@"application/json":value};
    [manager GET:firstURl parameters:nil progress:nil success:^(NSURLSessionDataTask * task, id  responseObject) {
        NSLog(@"======%@",responseObject);
        //json解析
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"====%@",dic);
        
        NSArray *arr = dic[@"data"][@"list"];
        
        //赋值
        [self.array addObjectsFromArray:arr];
        //刷新Ui
        [_myTable reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"=======%@",error);
        
        [self error];
        
    }];
    
    
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
