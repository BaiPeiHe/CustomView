//
//  NetWorkingTool.m
//  UI16_NetWorkIngTool
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "NetWorkingTool.h"

@implementation NetWorkingTool

+(void)netWorkingWithStrURL:(NSString *)strURL delegate:(id<NetWorkingToolDelegate>)delegate{
    // 接口
    NSURL *url = [NSURL URLWithString:strURL];
    // request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // Session
    NSURLSession *session = [NSURLSession sharedSession];
    
    //task
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_queue_t mainQUeue = dispatch_get_main_queue();
        dispatch_async(mainQUeue, ^{
            // 解析数据
            id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            // 代理人去执行协议方法
            [delegate bringResult:result];
        });
    }];
    // 任务的执行
    [task resume];
}


+(void)netWorkingWithStrURL:(NSString *)strURL block:(Block)block{
    NSURL *url = [NSURL URLWithString:strURL];
    
    //
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    //session
    NSURLSession *session = [NSURLSession sharedSession];
    
    // task
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        dispatch_sync(mainQueue, ^{
            id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            // 通过block把值返回
            block(result);
            
        });
    }];
    [task resume];
}

+(void)netWorkingWithStrURL:(NSString *)strURL type:(MethodType)type bodyStr:(NSString *)bodyStr block:(Block)block{
    NSURL *url = [NSURL URLWithString:strURL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    if(type == POSTType){
        [request setHTTPMethod:@"POST"];
        NSData *bodyData= [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:bodyData];
    }
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        dispatch_queue_t mainQUeue = dispatch_get_main_queue();
        dispatch_sync(mainQUeue, ^{
            
            id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            // 传值回去
            block(result);
        });
    }];
    [task resume];
}





@end
