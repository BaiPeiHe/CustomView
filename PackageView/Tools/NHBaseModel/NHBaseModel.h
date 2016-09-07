//
//  NHBaseModel.h
//  03.视频播放器
//
//  Created by dllo on 16/3/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NHBaseModel : NSObject

// 输入一个数组套字典,返回一个数组套Model
+(NSMutableArray *)baseModelByArr:(NSArray *)arr;

@end
