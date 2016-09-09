//
//  MultiConditionViewVertical.h
//  PackageView
//
//  Created by 白鹤 on 16/9/8.
//  Copyright © 2016年 白鹤. All rights reserved.
//

@class MultiConditionViewVertical;

#import <UIKit/UIKit.h>

@protocol MultiConditionViewDelegate <NSObject>

/**
 *  获得分区数
 */
-(NSInteger)numberOfSectionsInMultiConditionView:(MultiConditionViewVertical *)multiConditionView;

/**
 *  获得 Item 的个数
 */
- (NSInteger)multiConditionView:(MultiConditionViewVertical *)multiConditionView numberOfItemsInSections:(NSInteger)section;

/**
 *  获得 Item 的标题
 */
- (NSString *)multiConditionView:(MultiConditionViewVertical *)multiConditionView titlleForItemAtSection:(NSInteger)section Item:(NSInteger)item;

/**
 *  点击方法
 */
- (void)multiConditionView:(MultiConditionViewVertical *)multiConditionView didSelectItemAtSection:(NSInteger)section Item:(NSInteger)item;


@end

@interface MultiConditionViewVertical : UIView


/**
 *  初始化,最初的尺寸
 *
 *  @param frame 最初尺寸
 */
- (instancetype)initWithFrame:(CGRect)frame Delegate:(id<MultiConditionViewDelegate>)delegate;


/**
 *  刷新
 */
- (void)reloadConditionView;



@end
