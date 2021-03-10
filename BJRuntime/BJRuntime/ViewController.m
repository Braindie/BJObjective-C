//
//  ViewController.m
//  BJRuntime
//
//  Created by 张文军 on 2021/3/10.
//


#import "ViewController.h"

#import "BJRuntimeController.h"
#import "BJRuntimeMethodSwizzlingViewController.h"
#import "BJRuntimeGrammarViewController.h"
#import "BJRuntimeButtonViewController.h"
#import "BJRuntimeFontViewController.h"
#import "BJRuntimeForwordViewController.h"
#import "BJClassAndObjectViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, copy) NSArray *runtimeArray;


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
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.runtimeArray.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = self.runtimeArray[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BJRuntimeController *vc = [[BJRuntimeController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
//        BJClassAndObjectViewController *vc = [[BJClassAndObjectViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];

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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (NSArray *)runtimeArray {
    if (!_runtimeArray) {
        _runtimeArray = @[@""];
//        _runtimeArray = @[@"Runtime与NSObject",
//                          @"Runtime库函数",
//                          @"消息发送（objc_msgSend）",
//                          @"消息转发（objc_msgForward）",
//                          @"方法交换（Method Swizzling）",
//                          @"初始化函数",
//                          @"应用（防止按钮重复点击）",
//                          @"应用（修改字体大小）"];
    }
    return _runtimeArray;
}

@end
