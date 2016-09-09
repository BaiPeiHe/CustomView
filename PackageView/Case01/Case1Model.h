//
//  Case1Model.h
//  PackageView
//
//  Created by 白鹤 on 16/9/7.
//  Copyright © 2016年 白鹤. All rights reserved.
//

#import "NHBaseModel.h"

@interface Case1Model : NHBaseModel

/**
 *  分区的标题
 */
@property (nonatomic, copy)NSString *title;

/**
 *  当前分区的好友列表
 */
@property (nonatomic, strong)NSArray *data;

/**
 *  展开当前分区
 */
@property (nonatomic, assign)BOOL spread;




@end
