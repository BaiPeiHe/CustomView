//
//  UIButton+Extension.h
//  PackageView
//
//  Created by 白鹤 on 16/9/12.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

/**
 *  点击事件触发范围
 *  输入 正数表示缩小, 负数表示扩大
 */
@property(nonatomic, assign) UIEdgeInsets hitEdgeInsets;

@end
