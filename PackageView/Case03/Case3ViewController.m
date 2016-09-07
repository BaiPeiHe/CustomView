//
//  Case3ViewController.m
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "Case3ViewController.h"

#import "Masonry.h"

@interface Case3ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation Case3ViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor brownColor];
    
//    [self createData];
    
//    [self createView];
}

- (void)createData{
    
    self.dataArr = [NSMutableArray arrayWithObjects:@"QQ 通讯录界面",@"商品联动",@"多种限制条件检索视图", nil];
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

@end
