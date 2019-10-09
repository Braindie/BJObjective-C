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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  if (section == 0) {
    return 1;
  } else if (section == 1) {
    return 3;
  } else if (section == 2) {
    return 4;
  } else {
    return 0;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
  if (indexPath.section == 0) {
    if (indexPath.row == 0) {
      cell.textLabel.text = @"算法";
    }
  } else if (indexPath.section == 1) {
    if (indexPath.row == 0){
      cell.textLabel.text = @"多态";
    }else if (indexPath.row == 1){
      cell.textLabel.text = @"扩展、分类";
    }else if (indexPath.row == 2){
      cell.textLabel.text = @"KVC";
    }
  } else if (indexPath.section == 2) {
    if (indexPath.row == 0){
      cell.textLabel.text = @"代理";
    }else if (indexPath.row == 1){
      cell.textLabel.text = @"Block";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"通知";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"KVO";
    }
  }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  if (indexPath.section == 0) {
    if (indexPath.row == 0) {
      BJArithmeticViewController *vc = [[BJArithmeticViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
    }
  } else if (indexPath.section == 1) {
    if (indexPath.row == 0){
      BJPolymorphismViewController *vc = [[BJPolymorphismViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
      
    }else if (indexPath.row == 1){
      BJExtensionViewController *vc = [[BJExtensionViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
      
    }else if (indexPath.row == 2){
      BJKVCViewController *vc = [[BJKVCViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
      
    }
  } else if (indexPath.section == 2) {
    if (indexPath.row == 0){
      BJDelegateViewController *vc = [[BJDelegateViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
      
    }else if (indexPath.row == 1){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"有个单独的Demo" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [self.navigationController presentViewController:alert animated:YES completion:nil];
      
    }else if (indexPath.row == 2){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"太常见了，没写" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [self.navigationController presentViewController:alert animated:YES completion:nil];
        
    }else if (indexPath.row == 3){
        BJKVOViewController *vc = [[BJKVOViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 80;
}


@end
