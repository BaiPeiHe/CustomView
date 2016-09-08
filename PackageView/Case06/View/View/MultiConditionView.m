//
//  MultiConditionView.m
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "MultiConditionView.h"

@interface MultiConditionView ()

// 列数
@property (nonatomic, assign)NSInteger columns;

/**
 *  分区数数组
 */
@property (nonatomic, strong)NSArray *sectionsArr;

/**
 *  行数数组
 */
@property (nonatomic, strong)NSArray *rowsArr;

@end

@implementation MultiConditionView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self createData];
        [self createView];
    }
    return self;
}

- (void)createData{
    
    // 获得列数
    self.columns = [self.delegate numberOfColumnsInMultiConditionView:self];
    
    // 获得分区数
    if(self.columns == 0){
        self.columns = 1;
    }
    self.sectionsArr = [self bringSections:self.columns];
    
    // 获得行数
    self.rowsArr = [self bringRows:self.sectionsArr];
}

- (void)createView{
    
    
    
}


/**
 *  获得分区数
 */
- (NSArray *)bringSections:(NSInteger)columns{
    
    NSMutableArray *sections = [NSMutableArray array];
    
    for(NSInteger i = 0; i < columns; i++){
        
        NSNumber *section = [NSNumber numberWithInteger:[self.delegate multiConditionView:self numberOfSectionsInColumns:i]];
        
        [sections addObject:section];
    }
    
    return sections;
}

/**
 *  获得行数数组
 */

- (NSArray *)bringRows:(NSArray *)sections{
    
    NSMutableArray *rowsArr = [NSMutableArray array];
    
    for (NSNumber *section in rowsArr) {
        
        
        
        
    }
    
    
    return rowsArr;
}

- (void)reloadMultiConditionView{
    
    
}



@end
