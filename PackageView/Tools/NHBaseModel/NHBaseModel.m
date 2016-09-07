//
//  NHBaseModel.m
//  03.视频播放器
//
//  Created by dllo on 16/3/8.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "NHBaseModel.h"

@implementation NHBaseModel
// 输入一个数组套字典,返回一个数组套Model
+(NSMutableArray *)baseModelByArr:(NSArray *)arr{
    // 创建一个可变的数组
    NSMutableArray *array = [NSMutableArray array];
    
    // 传过的数组,是数组套字典的结构
    // 对数组进行遍历
    for (NSDictionary *tempDic in arr) {
        // 创建对象,对象的内容以字典为依据
        id model = [[self class] baseModelWithDic:tempDic];
        // 把对象添加到数组中去
        [array addObject:model];
    }
    return array;
}
// 写一个便利构造器,通过遍历构造器创建对象,并且把字典作为参数传到方法里
+ (instancetype)baseModelWithDic:(NSDictionary *)dic{
    // 创建一个Model对象
    // 通过[self class] 找到调用方法的类,然后通过类去调用alloc,从而实现创建对象
    id model = [[[self class] alloc] initWithDic:dic];
    return model;
}
// 遍历构造器封装了初始化方法,所以还需要一个初始化方法
- (instancetype)initWithDic:(NSDictionary *)dic{
    self = [super init];
    if(self){
        // 完成了字典对Model对象赋值的操作
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
