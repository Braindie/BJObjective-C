//
//  ViewController.m
//  TempDemo
//
//  Created by zhangwenjun on 16/6/2.
//  Copyright © 2016年 zcgt_ios_01. All rights reserved.
//

#import "ViewController.h"
#import "BJPolymorphismViewController.h"
#import "BJArithmeticViewController.h"
#import "BJDelegateViewController.h"
#import "BJKVCViewController.h"
#import "BJKVOViewController.h"
#import "BJExtensionViewController.h"

static NSString * str;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}



#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"算法";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"多态（swift类似）";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"代理";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"KVO";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"KVC";
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"扩展、分类";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        BJArithmeticViewController *vc = [[BJArithmeticViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        BJPolymorphismViewController *vc = [[BJPolymorphismViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        BJDelegateViewController *vc = [[BJDelegateViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        BJKVOViewController *vc = [[BJKVOViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 4){
        BJKVCViewController *vc = [[BJKVCViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 5){
        BJExtensionViewController *vc = [[BJExtensionViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
