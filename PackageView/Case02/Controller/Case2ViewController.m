//
//  Case2ViewController.m
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#define SECON_HEIGHT 44
#define SCREEN_WIDTH self.view.frame.size.width
#define SCREEN_HEIGHT self.view.frame.size.height

#import "Case2ViewController.h"
#import "Case1HeadView.h"
#import "Case1Model.h"
#import "Masonry.h"

@interface Case2ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation Case2ViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self createData];
    
    [self createView];
}

- (void)createData{
    
    // 新朋友,群聊,公共好
    NSArray *arr0 = [NSArray arrayWithObjects:@"第一个 Cell", nil];
    NSDictionary *dic0 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"",@"title",
                          arr0,@"data",
                          nil];
    
    // 特别关注
    NSArray *arr1 = [NSArray arrayWithObjects:@"霞纸", nil];
    NSDictionary *dic1 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"特别关心",@"title",
                          arr1,@"data",
                          nil];
    
    // 常用群聊
    NSArray *arr2 = [NSArray array];
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"常用群聊",@"title",
                          arr2,@"data",
                          nil];
    
    // 同学
    NSArray *arr3 = [NSArray arrayWithObjects:@"泰迪",@"哈士奇",@"金毛", nil];
    NSDictionary *dic3 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"同学",@"title",
                          arr3,@"data",
                          nil];
    
    // 同事
    NSArray *arr4 = [NSArray arrayWithObjects:@"鸽子",@"鹰",@"大鹏",@"麻雀",@"燕子", nil];
    NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"同事",@"title",
                          arr4,@"data",
                          nil];
    
    // 老乡
    NSArray *arr4_1 = [NSArray arrayWithObjects:@"鼹鼠",@"穿山甲",@"加菲猫", nil];
    NSDictionary *dic4_1 = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"同事",@"title",
                            arr4_1,@"data",
                            nil];
    
    // 手机通讯录
    NSArray *arr5 = [NSArray arrayWithObjects:@"家人", nil];
    NSDictionary *dic5 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"手机通讯录",@"title",
                          arr5,@"data",
                          nil];
    
    // 我的设备
    NSArray *arr6 = [NSArray arrayWithObjects:@"我的电脑",@"发现新设备", nil];
    NSDictionary *dic6 = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"我的设备",@"title",
                          arr6,@"data",
                          nil];
    
    
    NSArray *arr = [NSMutableArray arrayWithObjects:dic0,dic1, dic2, dic3, dic4,dic4_1, dic5, dic6, nil];
    
    self.dataArr = [NSMutableArray arrayWithArray:[Case1Model baseModelByArr:arr]];
    
    // 获得数据中的处理
    
    
    
}


- (void)createView{
    
    self.tableView = [UITableView new];
    [self.view addSubview:self.tableView];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    [self.tableView registerClass:[Case1HeadView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([Case1HeadView class])];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];
    
}


#pragma mark UITableView 协议方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    Case1Model *dataModel = self.dataArr[section];
    if(section == 0){
        return 1;
    }
    if(dataModel.spread){
        return dataModel.data.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    Case1Model *dataModel = self.dataArr[indexPath.section];
    
    cell.textLabel.text = dataModel.data[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    if(section == 0){
        return 10;
    }
    else if (section == 2){
        return 10;
    }
    else if (section == self.dataArr.count - 1){
        return 10;
    }
    else if (section == self.dataArr.count - 3){
        return 10;
    }
    else{
        return 0;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if(section == 0){
        return 0;
    }
    
    return SECON_HEIGHT;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    Case1HeadView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([Case1HeadView class])];
    
    headView.dataModel = self.dataArr[section];
    
    headView.callBack = ^(){
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
        
    };
    
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Case1Model *dataModel = self.dataArr[indexPath.section];
    NSLog(@"%@",dataModel.data[indexPath.row]);
    
}

@end
