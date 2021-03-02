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

#import "BJObjectViewController.h"
#import "BJExtensionViewController.h"
#import "BJDelegateViewController.h"
#import "BJKVCViewController.h"
#import "BJKVOViewController.h"

#import "BJDesignatedInitializerViewController.h"
#import "BJInitViewTypeViewController.h"

#import "BJRuntimeMethodSwizzlingViewController.h"
#import "BJRuntimeGrammarViewController.h"
#import "BJRuntimeButtonViewController.h"
#import "BJRuntimeFontViewController.h"
#import "BJRuntimeForwordViewController.h"
#import "BJClassAndObjectViewController.h"

static NSString * str;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSArray *commonsArray;

@property (nonatomic, copy) NSArray *basicsArray;

@property (nonatomic, copy) NSArray *messageArray;



@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"";

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.commonsArray.count;
    } else if (section == 1) {
        return self.basicsArray.count;
    } else if (section == 2) {
        return self.messageArray.count;
    } else if (section == 3) {
        return 0;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    if (indexPath.section == 0) {
        cell.textLabel.text = self.commonsArray[indexPath.row];

    } else if (indexPath.section == 1) {
        cell.textLabel.text = self.basicsArray[indexPath.row];

    } else if (indexPath.section == 2) {
        cell.textLabel.text = self.messageArray[indexPath.row];

    } else if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"Runtime与NSObject";

        }else if (indexPath.row == 1){
            cell.textLabel.text = @"Runtime库函数";

        }else if (indexPath.row == 2){
            cell.textLabel.text = @"消息发送（objc_msgSend）";

        }else if (indexPath.row == 3){
            cell.textLabel.text = @"消息转发（objc_msgForward）";

        }else if (indexPath.row == 4){
            cell.textLabel.text = @"方法交换（Method Swizzling）";

        }else if (indexPath.row == 5){
            cell.textLabel.text = @"应用（防止按钮重复点击）";

        }else if (indexPath.row == 6){
            cell.textLabel.text = @"应用（修改字体大小）";
        }
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            BJArithmeticViewController *vc = [[BJArithmeticViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 1) {
            BJPolymorphismViewController *vc = [[BJPolymorphismViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0){
            BJObjectViewController *vc = [[BJObjectViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }else if (indexPath.row == 1){
            BJKVOViewController *vc = [[BJKVOViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];


        }else if (indexPath.row == 2){
            BJKVCViewController *vc = [[BJKVCViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        } else if (indexPath.row == 3){
            BJInitViewTypeViewController *vc = [[BJInitViewTypeViewController alloc] init];
            vc.title = @"生命周期";
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 4){
            BJDesignatedInitializerViewController *vc = [[BJDesignatedInitializerViewController alloc] init];
            vc.title = @"指定初始化函数";
            [self.navigationController pushViewController:vc animated:YES];
        } else if (indexPath.row == 5){
            
            BJExtensionViewController *vc = [[BJExtensionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
        } else if (indexPath.row == 6){
            BJDelegateViewController *vc = [[BJDelegateViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            BJClassAndObjectViewController *vc = [[BJClassAndObjectViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }else if (indexPath.row == 1){
            BJRuntimeGrammarViewController *vc = [[BJRuntimeGrammarViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }else if (indexPath.row == 2){
            BJRuntimeMethodSwizzlingViewController *vc = [[BJRuntimeMethodSwizzlingViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }else if (indexPath.row == 3){
            BJRuntimeForwordViewController *vc = [[BJRuntimeForwordViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }else if (indexPath.row == 4){
            BJRuntimeButtonViewController *vc = [[BJRuntimeButtonViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }else if (indexPath.row == 5){
            BJRuntimeFontViewController *vc = [[BJRuntimeFontViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];

        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 250, 40)];
    label.font = [UIFont boldSystemFontOfSize:20];
    [view addSubview:label];
    
    switch (section) {
        case 0:
            label.text = @"";
            break;
        case 1:
            label.text = @"";
            break;
        case 2:
            label.text = @"";
            break;
        case 3:
            label.text = @"";
            break;
        default:
            break;
    }
    
    return view;
}


- (NSArray *)commonsArray {
    if (!_commonsArray) {
        _commonsArray = @[@"算法", @"多态"];
    }
    return _commonsArray;
}


- (NSArray *)basicsArray {
    if (!_basicsArray) {
        _basicsArray = @[@"对象", @"KVO", @"KVC", @"分类", @"生命周期", @"初始化函数"];
    }
    return _basicsArray;
}


- (NSArray *)messageArray {
    if (!_messageArray) {
        _messageArray = @[];
    }
    return _messageArray;
}



@end
