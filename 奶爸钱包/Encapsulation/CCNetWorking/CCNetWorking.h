//
//  CCNetWorking.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/8.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 请求成功的block
 
 @param info     返回信息
 @param response 响应体数据
 */

typedef void (^SucceedHanlder)(id response);

/**
 请求失败的block
 
 @param extInfo 扩展信息
 */
typedef void (^FailureHander)(NSError *error);

@interface CCNetWorking : NSObject

/**
 *POST
 */
+ (NSURLSessionTask *)PostRequestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(SucceedHanlder)success failure:(FailureHander)failure;

/**
 *GET
 */
+ (NSURLSessionTask *)getRequestWithURL:(NSString *)URL parameters:(NSDictionary *)parameter success:(SucceedHanlder)success failure:(FailureHander)failure;



@end
