//
//  zixunVC.m
//  News
//
//  Created by qingyun on 16/2/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "zixunVC.h"
#import "ZixunCell.h"
#import "AFNetworking.h"
#import "Header.h"

@interface zixunVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSMutableArray *array;


@end

@implementation zixunVC


-(NSMutableArray *)array{
    if (_array == nil) {
        _array = [[NSMutableArray alloc]init];
    }
    return _array;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 80;
    
    
    [self.view addSubview:_tableView];
    
    //执行网络请求
    [self requestNews];
    
    // Do any additional setup after loading the view.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{       ZixunCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[NSBundle mainBundle]loadNibNamed:@"ZixunCell" owner:self options:nil][0];
        
    }
    
    cell.dic = self.array[indexPath.row];
    return cell;
    
}
#pragma mark  ===========网络请求===========


-(void)requestNews{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        NSString *value=@"mo=news&ra=youlike&c_n=10&token=3fcf7144524f7dd1f8dacab2106945e2&c_pos=0&c_c=fx_qutu&s_code=ef4775d7cf0464a31f422c37b66cacb2&fr=kandian&_cv=3.0.1&uid=3fcf7144524f7dd1f8dacab2106945e2&tp=0";
    //设置响应序列化
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //设置参数
        NSDictionary *prameter=@{@"text/html":value};

    //
    [manager GET:secondUrl parameters:prameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"========%@",responseObject);
        
        //json解析
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"====%@",dic);
        
        
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"-------%@",error);
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
