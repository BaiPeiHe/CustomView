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
 *  获得分区数
 */

-(NSInteger)numberOfSectionsInMultiConditionView:(MultiConditionView *)multiConditionView;


/**
 *  获得行数
 */
- (NSInteger)multiConditionView:(MultiConditionView *)multiConditionView numberOfRowsInSections:(NSInteger)section;

/**
 *  获得分区的标题
 */
- (NSString *)multiConditionView:(MultiConditionView *)multiConditionView titleForSectionAtSection:(NSInteger)section;

/**
 *  获得行的标题
 */
- (NSString *)multiConditionView:(MultiConditionView *)multiConditionView titleForRowAtSection:(NSInteger)section Row:(NSInteger)row;

/**
 *  点击方法
 */
- (void)multiConditionView:(MultiConditionView *)multiConditionView didSelectRowAtAtSection:(NSInteger)section Row:(NSInteger)row;

@end


/**
 *  多条件视图
 */
@interface MultiConditionView : UIView


@property (nonatomic, assign)id<MultiConditionViewDelegate>delegate;



/**
 *  设置的是初始尺寸,而不是点击显示后的尺寸,点击后的尺寸自动计算
 */
- (instancetype)initWithFrame:(CGRect)frame Delegate:(id<MultiConditionViewDelegate>)delegate;

/**
 *  刷新
 */
- (void)reloadConditionView;

@end
