//
//  NetWorkingTool.h
//  UI16_NetWorkIngTool
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol NetWorkingToolDelegate <NSObject>
// 这里返回值是id类型,可以自动转换
- (void)bringResult:(id)result;

@end

typedef void(^Block)(id result);

typedef NS_ENUM(NSInteger ,MethodType){
    GETType,
    POSTType,
};

@interface NetWorkingTool : NSObject

// 根据方法调用的时候传过来的网址,获取数据,并解析数据
// 可以在加号方法中直接传过去一个协议参数,来指定协议
+(void)netWorkingWithStrURL:(NSString *)strURL delegate:(id<NetWorkingToolDelegate>)delegate;

+(void)netWorkingWithStrURL:(NSString *)strURL block:(Block)block;

+(void)netWorkingWithStrURL:(NSString *)strURL type:(MethodType)type bodyStr:(NSString *)bodyStr block:(Block)block;

@end
