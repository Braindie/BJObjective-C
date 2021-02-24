//
//  ViewController.m
//  BJProperty
//
//  Created by zhangwenjun on 17/3/2.
//  Copyright © 2017年 zhangwenjun. All rights reserved.
//

#import "ViewController.h"
#import "BJPropertyViewController.h"
#import "BJAutoreleasepoolViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *myTitleArray;
@property (nonatomic, strong) NSMutableArray *myClassArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%s",__func__);
    
    self.title = @"内存管理";
    self.view.backgroundColor = [UIColor whiteColor];
    self.myClassArray = @[].mutableCopy;
    self.myTitleArray = @[].mutableCopy;
    
    [self addCell:@"Property属性" class:@"BJPropertyViewController"];
    [self addCell:@"自动释放池" class:@"BJAutoreleasepoolViewController"];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

}

- (void)addCell:(NSString *)title class:(NSString *)vc {
    [self.myTitleArray addObject:title];
    [self.myClassArray addObject:vc];
}



#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _myTitleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text = _myTitleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class class = NSClassFromString(_myClassArray[indexPath.row]);
    if (class) {
        UIViewController *vc = [class new];
        vc.title = _myTitleArray[indexPath.row];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
