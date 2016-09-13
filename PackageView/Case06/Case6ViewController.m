//
//  Case6ViewController.m
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "Case6ViewController.h"
#import "MultiConditionView.h"
#import "Masonry.h"

@interface Case6ViewController ()<MultiConditionViewDelegate>


@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) MultiConditionView *conditionView;


@end

@implementation Case6ViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self createData];
    
    [self createView];
}

- (void)createData{
    
    
    
}


- (void)createView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.conditionView = [[MultiConditionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 44) Delegate:self];
    [self.view addSubview:self.conditionView];
    
    self.conditionView.backgroundColor = [UIColor brownColor];
}

// 分区数
- (NSInteger)numberOfSectionsInMultiConditionView:(MultiConditionView *)multiConditionView{
    
    return 3;
}

// Row
- (NSInteger)multiConditionView:(MultiConditionView *)multiConditionView numberOfRowsInSections:(NSInteger)section{
    
    if(section == 0){
        return 3;
    }
    else if(section == 1){
        return 2;
    }
    else{
        return 4;
    }
}
// 标题
- (NSString *)multiConditionView:(MultiConditionView *)multiConditionView titleForSectionAtSection:(NSInteger)section{
    
    return [NSString stringWithFormat:@"标题 :%ld",section];
    
}

// 内容
- (NSString *)multiConditionView:(MultiConditionView *)multiConditionView titleForRowAtSection:(NSInteger)section Row:(NSInteger)row{
    
    return [NSString stringWithFormat:@"内容 :%ld : 第 %ld 行",section, row];
}

// 点击方法
- (void)multiConditionView:(MultiConditionView *)multiConditionView didSelectRowAtAtSection:(NSInteger)section Row:(NSInteger)row{
    
    NSLog(@"点击: %ld行  %ld 列",section,row);
    
}




@end
