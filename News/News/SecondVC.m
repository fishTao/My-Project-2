//
//  SecondVC.m
//  News
//
//  Created by qingyun on 16/1/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SecondVC.h"
#import "AFNetworking.h"
#import "Header.h"

@interface SecondVC ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong) UITableView *myTable;
@property (nonatomic ,strong) NSMutableArray *datas;

@end

@implementation SecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _datas = [[NSMutableArray alloc]init];
  //  _datas = @[@"234567",@"fdgbstfjftykmsr",@"1234567"];
    
   //[self requestNews];
    
    //设置背景色
    self.view.backgroundColor = [UIColor whiteColor];
    //添加按钮
    UIBarButtonItem *btn1 = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(click:)];
    self.navigationItem.leftBarButtonItem = btn1;

    
    //导航栏设为不透明
    self.navigationController.navigationBar.translucent = NO;
    
    
    _myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    _myTable.delegate = self;
    _myTable.dataSource = self;


    
    [self.view addSubview:_myTable];

    
    // Do any additional setup after loading the view from its nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identfile = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfile];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfile];
    }

    //显示多行
    cell.textLabel.numberOfLines = 0;
    //文字自适应大小
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.text = _datas[indexPath.row];
    
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
    [manager GET:secondURl parameters:nil progress:nil success:^(NSURLSessionDataTask * task, id  responseObject) {
        NSLog(@"======%@",responseObject);
        //json解析
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"==-==%@",dic);
//        
//        NSMutableArray *arr = dic[@"data"][@"list"];
//        
//        //赋值
//        [self.datas addObjectsFromArray:arr];
//        //刷新Ui
//        [_myTable reloadData];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"=======%@",error);
    }];
    
    
}







- (void)click:(UIBarButtonItem *)sender{


    [self.navigationController popViewControllerAnimated:YES];
    [self hidesBottomBarWhenPushed];
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
