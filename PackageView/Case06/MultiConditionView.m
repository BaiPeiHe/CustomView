//
//  MultiConditionView.m
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#define ROW_HEIGHT 44

#define VIEW_WIDTH self.frame.size.width
#define VIEW_HEIGHT self.frame.size.height

#import "MultiConditionView.h"

@interface MultiConditionView ()<UITableViewDelegate,UITableViewDataSource>

// 分区数
@property (nonatomic, assign)NSInteger sections;

/**
 *  行数数组
 */
@property (nonatomic, strong)NSArray *rowsArr;

/**
 *  当前显示视图的位置
 */
@property (nonatomic, assign)NSInteger titleIndex;


/**
 *  显示的 TableView
 */
@property (nonatomic, strong)UITableView *tableView;

@end

@implementation MultiConditionView
{
    /**
     *  标题的高
     */
    CGFloat titleHeight;
    
}
/**
 *  标题的 BaseTag
 */
static const NSInteger sectionBaseTag = 2000;




- (instancetype)initWithFrame:(CGRect)frame Delegate:(id<MultiConditionViewDelegate>)delegate{
    self = [super initWithFrame:frame];
    if(self){
        titleHeight = frame.size.height;
        self.delegate = delegate;
        [self createData];
        [self createView];
    }
    return self;
}

- (void)createData{
    
    self.sections = [self.delegate numberOfSectionsInMultiConditionView:self];
    self.titleIndex = -1;
}

- (void)createView{
    
    CGFloat sectionWeight = VIEW_WIDTH / (self.sections * 1.0);
    
    NSLog(@"%f",sectionWeight);
    
    for(NSInteger i = 0; i < self.sections; i++){
        
        NSString *sectionTitle = [self.delegate multiConditionView:self titleForSectionAtSection:i];
        
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.frame = CGRectMake(i * sectionWeight, 0, sectionWeight, titleHeight);
        [self addSubview:titleButton];
        
        titleButton.tag = sectionBaseTag + i;
        [titleButton setTitle:sectionTitle forState:UIControlStateNormal];
        [titleButton addTarget:self action:@selector(updateConditionView:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

- (UITableView *)tableView{
    
    if(!_tableView){
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, titleHeight, VIEW_WIDTH, 0) style:UITableViewStylePlain];
        [self addSubview:_tableView];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        
    }
    return _tableView;
}

#pragma mark TableView 的协议方法

// 分区数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

// Cell数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.delegate multiConditionView:self numberOfRowsInSections:self.titleIndex];
}

// 创建
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *rowTitle = [self.delegate multiConditionView:self titleForRowAtSection:self.titleIndex Row:indexPath.row];
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    [cell.textLabel setText:rowTitle];
    
    return cell;
}


// 点击方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.delegate multiConditionView:self didSelectRowAtAtSection:self.titleIndex Row:indexPath.row];
    
}



/**
 *  更新多条件视图
 *
 *  @param index 点击的标题的位置
 */
- (void)updateConditionView:(UIButton *)sender{
    
    NSInteger index = sender.tag - sectionBaseTag;
    
    if(sender.selected){
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.tableView.frame = CGRectMake(0, titleHeight, self.tableView.frame.size.width, 0);
            
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, VIEW_WIDTH, titleHeight);
        }];
        
    }
    else{
        
        self.titleIndex = index;
        NSInteger rowCount = [self.delegate multiConditionView:self numberOfRowsInSections:self.titleIndex];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.tableView.frame = CGRectMake(0, titleHeight, self.tableView.frame.size.width, rowCount * ROW_HEIGHT);
            
            self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, VIEW_WIDTH, titleHeight + rowCount * ROW_HEIGHT);
        }];
    }
    
    sender.selected = !sender.selected;
    
    [self.tableView reloadData];
}


/**
 *  刷新
 */
- (void)reloadConditionView{
    
}



@end
