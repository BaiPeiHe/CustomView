//
//  Case4ViewController.m
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#define Width self.view.frame.size.width
#define Height self.view.frame.size.height

#import "Case4ViewController.h"
#import "NetWorkingTool.h"
@interface Case4ViewController ()<UITableViewDataSource,UITableViewDelegate>
// 主视图
@property(nonatomic, retain)UITableView *mainTableView;
// 主视图的数据
@property(nonatomic, retain)NSMutableArray *mainArr;
// 副视图
@property(nonatomic, retain)UITableView *deputyTableView;
// 排序的数组
@property(nonatomic, retain)NSMutableArray *rankArr;
@property(nonatomic, retain)NSMutableDictionary *abcDic;

@property(nonatomic, retain)NSMutableArray *deputyArr;
// 保存分区的个数
@property(nonatomic, retain)NSMutableArray *sectionCountArr;
// 保存分区的标题
@property(nonatomic, retain)NSMutableArray *sectionTitleArr;
@end

@implementation Case4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 读取数据
    [self createData];
    // 创建View
    [self createView];
}
#pragma mark 读取数据
- (void)createData{
    NSString *strURL = @"http://lib3.wap.zol.com.cn/index.php?c=Advanced_SubcateList_V1&noParam=1";
    [NetWorkingTool netWorkingWithStrURL:strURL block:^(id result) {
        self.mainArr = result;
        [self.mainTableView reloadData];
    }];
}

#pragma mark 创建View
- (void)createView{
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height - 64)];
    [self.view addSubview:self.mainTableView];
    
    self.mainTableView.dataSource = self;
    self.mainTableView.delegate = self;
    
    [self.mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"mainReuse"];
}
// 创建副TableView
- (void)createDeputyTableView{
    self.deputyTableView = [[UITableView alloc] initWithFrame:CGRectMake(Width / 3 , 64, Width / 3 * 2, Height - 64)];
    
    [self.view addSubview:self.deputyTableView];
    
    self.deputyTableView .dataSource = self;
    self.deputyTableView.delegate = self;
    
    [self.deputyTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"deputyReuse"];
}
#pragma mark 实现TableView的协议方法
// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == self.mainTableView){
        return self.mainArr.count;
    }
    else{
        return [self.sectionCountArr[section] integerValue];
    }
}
// 创建Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == self.mainTableView){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainReuse"];
        cell.textLabel.text = self.mainArr[indexPath.row][@"name"];
        return cell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"deputyReuse"];
        
        // 找到当前的Cell在副视图数组中的位置
        NSInteger index = 0;
        for(NSInteger i = 0; i < indexPath.section ; i++){
            index += [self.sectionCountArr[i] integerValue];
        }
        index += indexPath.row;
        cell.textLabel.text = self.deputyArr[index][@"name"];
        return cell;
    }
}
// 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == self.mainTableView){
        NSString *strURL = [NSString stringWithFormat:@"http://lib3.wap.zol.com.cn/index.php?c=Advanced_Manu_V1&subcateId=%@",self.mainArr[indexPath.row][@"subId"]];
        
        // 请求数据,获得当前主视图多所对应的副视图的数据
        
        [NetWorkingTool netWorkingWithStrURL:strURL block:^(id result) {
            self.rankArr = result[@"rank"];
            self.abcDic = result[@"abc"];
            self.deputyArr = [NSMutableArray array];
            self.sectionCountArr = [NSMutableArray array];
            // 添加元素
            [self.deputyArr addObjectsFromArray:self.rankArr];
            // 添加当前区里的行数
            [self.sectionCountArr addObject:[NSString stringWithFormat:@"%ld",self.rankArr.count]];
            
            // 分区的标题数组
            self.sectionTitleArr = [NSMutableArray arrayWithObjects:@"热",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z", nil];
            
            // 遍历所有的数据
            for(NSInteger i = 1; i < self.sectionTitleArr.count; i++){
                
                // 将当前字典中的数据添加到数组中,同时让所有的数据,有序的排列
                NSArray *tempArr = [self.abcDic objectForKey:self.sectionTitleArr[i]];
                
                if(tempArr.count == 0){
                    // 将没有数据的分区移除
                    [self.sectionTitleArr removeObjectAtIndex:i];
                    i -= 1;
                }
                else{
                    // 将有数据的分区添加到副视图保存数据的数组中
                    [self.deputyArr addObjectsFromArray:tempArr];
                    // 保存当前分区的数据的个数
                    [self.sectionCountArr addObject:[NSString stringWithFormat:@"%ld",tempArr.count]];
                }
            }
            //
            [self.deputyTableView removeFromSuperview];
            [self createDeputyTableView];
            self.mainTableView.frame = CGRectMake(0, 64, Width / 3, Height - 64);
            [self.deputyTableView reloadData];
        }];
    }
}
#pragma mark 设置分区
// 设置屏幕右边的快捷条
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    if(tableView == self.deputyTableView){
        
        return  self.sectionTitleArr;
    }
    else{
        return nil;
    }
}

// 设置tableView里有几个分区
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if(tableView == self.deputyTableView){
        return self.sectionTitleArr.count;
    }
    else{
        return 1;
    }
}
// 头
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(tableView == self.deputyTableView){
        return self.sectionTitleArr[section];
    }
    else{
        return nil;
    }
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
