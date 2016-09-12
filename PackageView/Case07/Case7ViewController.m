//
//  Case7ViewController.m
//  PackageView
//
//  Created by 白鹤 on 16/9/8.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "Case7ViewController.h"
#import "MultiConditionViewVertical.h"
#import "UIButton+Extension.h"

@interface Case7ViewController ()<MultiConditionViewDelegate>

@property (nonatomic, strong)MultiConditionViewVertical *conditionView;


@end


@implementation Case7ViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    [self createData];
    
    [self createView];
}

- (void)createData{
    
    
    
}


- (void)createView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.conditionView = [[MultiConditionViewVertical alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 40) Delegate:self];
    self.conditionView.backgroundColor = [UIColor yellowColor];
//    self.conditionView.alpha = 0.6;
    
    [self.view addSubview:self.conditionView];
}

#pragma mark ConditionView 协议方法

- (NSInteger)numberOfSectionsInMultiConditionView:(MultiConditionViewVertical *)multiConditionView{
    
    return 2;
}


- (NSInteger)multiConditionView:(MultiConditionViewVertical *)multiConditionView numberOfItemsInSections:(NSInteger)section{
    
    return 3;
}

- (NSString *)multiConditionView:(MultiConditionViewVertical *)multiConditionView titlleForItemAtSection:(NSInteger)section Item:(NSInteger)item{
    
    if(item == 0){
        return @"哈哈哈hahahah";
    }
    else if(item == 1){
        return @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈hahaha";
    }
    else if (item == 2){
        return @"哈哈哈";
    }
    else{
        return @"哈哈哈";
    }
}

-(void)multiConditionView:(MultiConditionViewVertical *)multiConditionView didSelectItemAtSection:(NSInteger)section Item:(NSInteger)item{
    
    
    NSLog(@"%ld行 : %ld 列",section,item);
    
}


- (void)btAction{
    
    NSLog(@"点击");
    
}


@end
