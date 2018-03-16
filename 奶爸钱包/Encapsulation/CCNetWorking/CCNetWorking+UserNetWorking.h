//
//  CCNetWorking+UserNetWorking.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/8.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "CCNetWorking.h"

@interface CCNetWorking (UserNetWorking)

/**
 *登录
 */
+(NSURLSessionTask *)LoginRequestWithParameters:(NSDictionary *)parameter success:(SucceedHanlder)success failure:(FailureHander)failure;

@end
