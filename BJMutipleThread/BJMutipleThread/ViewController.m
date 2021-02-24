//
//  ViewController.m
//  BJMutipleThread
//
//  Created by zhangwenjun on 2019/2/28.
//  Copyright © 2019 zhangwenjun. All rights reserved.
//

#import "ViewController.h"
#import "NSThreadViewController.h"
#import "NSOperationViewController.h"
#import "GCDViewController.h"
#import "BJBarrierViewController.h"
#import "BJGCDBarrierViewController.h"
#import "BJDeadlockViewController.h"
#import "BJCloseGCDViewController.h"
#import "BJThreadSafeViewController.h"
#import "BJSyncAndAsyncViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  if (section == 0) {
    return 1;
  } else if (section == 1) {
    return 1;
  } else if (section == 2) {
    return 7;
  } else {
    return 0;
  }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
  if (indexPath.section == 0) {
    if (indexPath.row == 0) {
      cell.textLabel.text = @"NSThread";
    }
  } else if (indexPath.section == 1) {
    if (indexPath.row == 0){
      cell.textLabel.text = @"NSOperation";
    }
  } else if (indexPath.section == 2) {
    if (indexPath.row == 0){
      cell.textLabel.text = @"GCD";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"同步与异步";
      
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"线程依赖（dispatch_group_notify）";
      
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"线程安全（dispatch_barrier_async）";
      
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"@synchronized";
      
    }else if (indexPath.row == 5){
        cell.textLabel.text = @"死锁";
      
    }else if (indexPath.row == 6){
      cell.textLabel.text = @"线程（GCD）关闭问题";
    }
  }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
  if (indexPath.section == 0) {
    if (indexPath.row == 0) {
      NSThreadViewController *vc = [[NSThreadViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
    
    }
  } else if (indexPath.section == 1) {
    if (indexPath.row == 0){
      NSOperationViewController *vc = [[NSOperationViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
      
    }
  } else if (indexPath.section == 2) {
    if (indexPath.row == 0){
      
      GCDViewController *vc = [[GCDViewController alloc] init];
      [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        BJSyncAndAsyncViewController *vc = [[BJSyncAndAsyncViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
      
    }else if (indexPath.row == 2){
        BJBarrierViewController *vc = [[BJBarrierViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
      
    }else if (indexPath.row == 3){
        BJGCDBarrierViewController *vc = [[BJGCDBarrierViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
      
    }else if (indexPath.row == 4){
        BJThreadSafeViewController *vc = [[BJThreadSafeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
      
    }else if (indexPath.row == 5){
        BJDeadlockViewController *vc = [[BJDeadlockViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
      
    }else if (indexPath.row == 6){
      
        BJCloseGCDViewController *vc = [[BJCloseGCDViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
  }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  return 50;
}
@end

