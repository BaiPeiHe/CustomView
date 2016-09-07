//
//  Case5ViewController.m
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "Case5ViewController.h"

#define Width self.view.frame.size.width
#define Height self.view.frame.size.height

@interface Case5ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, retain)NSMutableArray *proArr;
@property(nonatomic, retain)NSMutableArray *cityArr;
@property(nonatomic, retain)NSMutableArray *zoneArr;

@property(nonatomic, retain)UITableView *proTableView;
@property(nonatomic, retain)UITableView *cityTableView;
@property(nonatomic, retain)UITableView *zoneTableView;
@end

@implementation Case5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    // 取消第一个TableView的自动适应界面
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 获取数据
    [self createData];
    
    // 铺界面
    [self createView];
}

#pragma mark 铺界面

- (void)createView{
    
    // 省界面
    self.proTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, Width / 3, Height) style:UITableViewStylePlain];
    [self.view addSubview:self.proTableView];
    
    // 签协议,指定代理人
    self.proTableView.dataSource = self;
    self.proTableView.delegate = self;
    
    // 市界面
    self.cityTableView = [[UITableView alloc] initWithFrame:CGRectMake(Width / 3, 64, Width / 3, Height) style:UITableViewStylePlain];
    [self.view addSubview:self.cityTableView];
    
    // 签协议,指定代理人
    self.cityTableView.dataSource = self;
    self.cityTableView.delegate = self;
    
    
    // 区界面
    self.zoneTableView = [[UITableView alloc] initWithFrame:CGRectMake(Width / 3 * 2, 64, Width / 3, Height) style:UITableViewStylePlain];
    [self.view addSubview:self.zoneTableView];
    
    // 签协议,指定代理人
    self.zoneTableView.dataSource = self;
    self.zoneTableView.delegate = self;
    
    
}


#pragma mark 获取数据

- (void)createData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"area" ofType:@"txt"];
    NSString *str = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *strArr = [str componentsSeparatedByString:@"\n"];
    
    self.proArr = [NSMutableArray array];
    // 将数据添加到省市区中
    for (NSString *temp in strArr) {
        // 是省
        if(![temp hasPrefix:@" "]){
            
            // 创建保存一个的数据的字典
            NSMutableDictionary *proDic = [NSMutableDictionary dictionary];
            
            // 添加省的名称
            [proDic setObject:temp forKey:@"proName"];
            
            // 创建一个字典,保存当前省的城市的信息
            NSMutableArray *cityArr = [NSMutableArray array];
            
            // 将市数组,添加到省字典中
            [proDic setObject:cityArr forKey:@"cityArr"];
            
            // 将省字典添加到省数组中
            [self.proArr addObject:proDic];
        }
        // 是区
        else if([temp hasPrefix:@"    "]){
            // 获得当前的区
            // 需要先获得当前的省(就是数组中的最后一个),然后是当前省的当前的城市(也是当前数组中的最后一个),然后获得区(同样是最后一个)
            NSMutableArray *zoneArr = [[self.proArr lastObject][@"cityArr"]lastObject][@"zoneArr"];
            // 将当前的区,添加到区数组中
            [zoneArr addObject:temp];
        }
        // 是城市
        else{
            NSMutableDictionary *cityDic = [NSMutableDictionary dictionary];
            [cityDic setObject:temp forKey:@"cityName"];
            
            NSMutableArray *zoneArr = [NSMutableArray array];
            [cityDic setObject:zoneArr forKey:@"zoneArr"];
            
            NSMutableArray *cityArr = [self.proArr lastObject][@"cityArr"];
            [cityArr addObject:cityDic];
        }
    }
}

#pragma mark 实现TableView的协议方法
// 设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.proTableView == tableView){
        return self.proArr.count;
    }
    else if(self.cityTableView == tableView){
        return self.cityArr.count;
    }
    else{
        return self.zoneArr.count;
    }
}
// 创建cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(self.proTableView == tableView){
        static NSString *proReuse = @"pro";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:proReuse];
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:proReuse];
        }
        cell.textLabel.text = self.proArr[indexPath.row][@"proName"];
        return cell;
    }
    else if(self.cityTableView == tableView){
        static NSString *cityReuse = @"city";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cityReuse];
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cityReuse];
        }
        cell.textLabel.text = self.cityArr[indexPath.row][@"cityName"];
        return cell;
    }
    else {
        static NSString *zoneReuse = @"zone";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:zoneReuse];
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:zoneReuse];
        }
        cell.textLabel.text = self.zoneArr[indexPath.row];
        return cell;
    }
}
// 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.proTableView == tableView){
        self.cityArr = self.proArr[indexPath.row][@"cityArr"];
        [self.cityTableView reloadData];
    }
    else if(self.cityTableView == tableView){
        self.zoneArr = self.cityArr[indexPath.row][@"zoneArr"];
        [self.zoneTableView reloadData];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
