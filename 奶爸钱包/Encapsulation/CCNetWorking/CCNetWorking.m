//
//  CCNetWorking.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/8.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "CCNetWorking.h"

@implementation CCNetWorking

#pragma mark -- post请求
+(NSURLSessionTask *)PostRequestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(SucceedHanlder)success failure:(FailureHander)failure{
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    // 设置请求头
    //    [PPNetworkHelper setValue:@"9" forHTTPHeaderField:@"fromType"];
    //发起请求
    [MBManager showLoading];
    
//    [PPNetworkHelper setRequestSerializer:PPRequestSerializerHTTP];
//    
//    [PPNetworkHelper setResponseSerializer:(PPResponseSerializerJSON)];
    
    return [PPNetworkHelper POST:URL parameters:parameter success:^(id responseObject) {
        
        [MBManager dismiss];
        
        if ([responseObject[@"respCode"] integerValue] == 000) {
            
            success(responseObject);
            
        }else{
            
            [MBManager showTips:responseObject[@"respDesc"]];
            
        }
    } failure:^(NSError *error) {
        
        [MBManager dismiss];
        
        [MBManager showTips:@"请求失败"];
        
        failure(error);
    }];
}

#pragma mark --get请求
+ (NSURLSessionTask *)getRequestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(SucceedHanlder)success failure:(FailureHander)failure{
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    // 设置请求头
    //    [PPNetworkHelper setValue:@"9" forHTTPHeaderField:@"fromType"];
    //发起请求
    [MBManager showLoading];
    [PPNetworkHelper setRequestSerializer:PPRequestSerializerHTTP];
    [PPNetworkHelper setResponseSerializer:(PPResponseSerializerJSON)];
    return [PPNetworkHelper GET:URL parameters:parameter success:^(id responseObject) {
        [MBManager dismiss];
       
        success(responseObject);
        
    } failure:^(NSError *error) {
        
        [MBManager dismiss];
        
        [MBManager showTips:@"请求失败"];
        
        failure(error);
    }];
    
}

@end
