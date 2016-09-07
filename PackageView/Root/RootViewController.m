//
//  RootViewController.m
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "RootViewController.h"
#import "Case1ViewController.h"
#import "Case2ViewController.h"
#import "Case3ViewController.h"
#import "Case4ViewController.h"
#import "Case5ViewController.h"
#import "Case6ViewController.h"

#import "Masonry.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation RootViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self createData];
    
    [self createView];
}

- (void)createData{
    
    self.dataArr = [NSMutableArray arrayWithObjects:
            /* 01 */   @"Case01   QQ 通讯录界面 - 全部刷新",
            /* 02 */   @"Case02   QQ 通讯录界面 - 局部刷新",
            /* 03 */   @"Case03   商品分类展示 - TableView联动",
            /* 04 */   @"Case04   中关村 - TableView联动",
            /* 05 */   @"Case05   省市区 - TableView联动",
            /* 06 */   @"Case06   多种限制条件检索视图",
                                nil];
}


- (void)createView{
    
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    
}


#pragma mark UITableView 协议方法


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.row) {
        case 0:{
            
            Case1ViewController *case1VC = [[Case1ViewController alloc] init];
            [self.navigationController pushViewController:case1VC animated:YES];
            
            break;
        }
        case 1:{
            
            Case2ViewController *case2VC = [[Case2ViewController alloc] init];
            [self.navigationController pushViewController:case2VC animated:YES];
            
            break;
        }
        case 2:{
            
            Case3ViewController *case3VC = [[Case3ViewController alloc] init];
            [self.navigationController pushViewController:case3VC animated:YES];
            
            break;
        }
        case 3:{
            
            Case4ViewController *case4VC = [[Case4ViewController alloc] init];
            [self.navigationController pushViewController:case4VC animated:YES];
            
            break;
        }
        case 4:{
            
            Case5ViewController *case5VC = [[Case5ViewController alloc] init];
            [self.navigationController pushViewController:case5VC animated:YES];
            
            break;
        }
        case 5:{
            
            Case6ViewController *case6VC = [[Case6ViewController alloc] init];
            [self.navigationController pushViewController:case6VC animated:YES];
            
            break;
        }
        default:
            break;
    }
    
}



@end
