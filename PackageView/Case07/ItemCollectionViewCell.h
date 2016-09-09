//
//  ItemCollectionViewCell.h
//  PackageView
//
//  Created by 白鹤 on 16/9/8.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy)NSString *title;


/**
 *  设置 Cell 的状态,点击 或 未被点击
 *
 *  @param isClick 当前 Cell 是否为被点击状态
 */
- (void)setCellStatue:(BOOL)isClick;

@end
