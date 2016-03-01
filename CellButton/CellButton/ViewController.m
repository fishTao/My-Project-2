//
//  ViewController.m
//  CellButton
//
//  Created by qingyun on 16/2/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "secondVC.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    
    tableview.delegate = self;
    tableview.dataSource = self;
    
    
    [self.view addSubview:tableview];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    
    
    
    
//    //拍照button
//    UIButton  *photographButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    photographButton.frame = CGRectMake(100 , 100, 50, 40);
//    
//    [photographButton setImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
//    
//    [photographButton addTarget:self action:@selector(photographButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    
//    photographButton.tag = indexPath.row;
//    [cell.contentView addSubview:photographButton];
    
    return cell;
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    secondVC *vcq = [[secondVC alloc]init];
    
    [self.navigationController pushViewController:vcq animated:YES];
}


//- (void)photographButtonClicked:(UIButton *)sender{
//
//    secondVC *vcq = [[secondVC alloc]init];
// 
//    [self.navigationController pushViewController:vcq animated:YES];
//    
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
