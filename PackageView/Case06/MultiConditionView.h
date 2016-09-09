//
//  MultiConditionView.h
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MultiConditionView;

@protocol MultiConditionViewDelegate <NSObject>

/**
 *  获得列数
 */

-(NSInteger)numberOfColumnsInMultiConditionView:(MultiConditionView *)multiConditionView;

/**
 *  获得分区数
 */

- (NSInteger)multiConditionView:(MultiConditionView *)multiConditionView numberOfSectionsInColumns:(NSInteger)columns;

/**
 *  获得行数
 */
- (NSInteger)multiConditionView:(MultiConditionView *)multiConditionView numberOfRowsInSections:(NSInteger)section;

@end


/**
 *  多条件视图
 */
@interface MultiConditionView : UIView


@property (nonatomic, assign)id<MultiConditionViewDelegate>delegate;



/**
 *  初始化
 */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 *  刷新
 */
- (void)reloadConditionView;

@end
