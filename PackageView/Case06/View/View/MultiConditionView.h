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
 *  获得行数
 */
- (NSInteger)multiConditionView:(MultiConditionView *)multiConditionView numberOfRowsInColumns:(NSInteger)columns;

@end
/**
 *  多条件视图
 */
@interface MultiConditionView : UIView

/**
 *  初始化
 */
- (instancetype)initWithFrame:(CGRect)frame;

/**
 *  刷新
 */
- (void)reloadMultiConditionView;

@end
