//
//  ViewController.m
//  BJThread
//
//  Created by zhangwenjun on 17/3/3.
//  Copyright © 2017年 zhangwenjun. All rights reserved.
//

#import "ViewController.h"
#import "BJRunLoopModeViewController.h"
#import "BJTimerCycleViewController.h"
#import "BJCFRunLoopRefViewController.h"
#import "BJRunloopAndThreadViewController.h"

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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"NSRunLoopMode";
    }else if (indexPath.row == 1){
        cell.textLabel.text = @"CFRunLoopRef";
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"Runloop与多线程";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"NSTimer的循环引用";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        BJRunLoopModeViewController *vc = [[BJRunLoopModeViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 1){
        BJCFRunLoopRefViewController *vc = [[BJCFRunLoopRefViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 2){
        BJRunloopAndThreadViewController *vc = [[BJRunloopAndThreadViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.row == 3){
        BJTimerCycleViewController *vc = [[BJTimerCycleViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
