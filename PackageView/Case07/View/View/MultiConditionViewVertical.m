//
//  MultiConditionViewVertical.m
//  PackageView
//
//  Created by 白鹤 on 16/9/8.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#define ITEM_HEIGHT 30
#define ITEM_WIDTH 60

#define VIEW_WIDTH self.frame.size.width

#import "MultiConditionViewVertical.h"

@interface MultiConditionViewVertical ()<UICollectionViewDelegate,UICollectionViewDataSource>

/**
 *  分区数
 */
@property (nonatomic, assign)NSInteger section;

/**
 *  每一个的标题
 */
@property (nonatomic, strong)NSMutableArray *itemsTitle;


@end

@implementation MultiConditionViewVertical


- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        [self createData];
        
        [self createView];
    }
    return self;
}

- (void)createData{
    
    
    self.section = [self.delegate numberOfSectionsInMultiConditionView:self];
    if(self.section == 0){
        return;
    }
    self.itemsTitle = [NSMutableArray array];
    
    for(NSInteger section = 0; section < self.section; section++){
        
        NSMutableArray *itemArr = [NSMutableArray array];
        
        NSInteger itemCount = [self.delegate multiConditionView:self numberOfItemsInSections:section];
        
        for(NSInteger item = 0; item < itemCount; item++){
            
            NSString *title = [self.delegate multiConditionView:self titlleForItemAtSection:section Item:item];
            
            [itemArr addObject:title];
        }
        [self.itemsTitle addObject:itemArr];
    }
}

- (void)createView{
    
    for(NSInteger i = 0; i < self.section; i++){
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(20, 15);
        // 间距
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        // 边框
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        // 滑动方向为水平
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, i * ITEM_HEIGHT, VIEW_WIDTH, ITEM_HEIGHT) collectionViewLayout:flowLayout];
        [self addSubview:collectionView];
        
        
        
    }
    
    
}


@end
