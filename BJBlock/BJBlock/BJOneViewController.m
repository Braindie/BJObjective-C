//
//  BJOneViewController.m
//  BJBlock
//
//  Created by zhangwenjun on 16/12/26.
//  Copyright © 2016年 zhangwenjun. All rights reserved.
//

#import "BJOneViewController.h"
#import "BJTwoViewController.h"
#import "BJBlockViewController.h"
#import "BJRealizeViewController.h"

@interface BJOneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation BJOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"Block";
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"block的分类（捕获外部变量）";
    }else if (indexPath.row == 1){
      cell.textLabel.text = @"循环引用解决方法";
    }else if (indexPath.row == 2){
       cell.textLabel.text = @"block的原理（包含了__block的作用)";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
      BJRealizeViewController *vc = [[BJRealizeViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];

    }else if (indexPath.row == 1){
      BJTwoViewController *vc = [[BJTwoViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
      
    }else if (indexPath.row == 2){
      BJBlockViewController *vc = [[BJBlockViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
    }
}



@end
