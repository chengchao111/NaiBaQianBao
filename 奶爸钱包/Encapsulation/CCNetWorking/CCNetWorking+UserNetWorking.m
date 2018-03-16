//
//  CCNetWorking+UserNetWorking.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/8.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "CCNetWorking+UserNetWorking.h"

@implementation CCNetWorking (UserNetWorking)

#pragma mark --登录
+(NSURLSessionTask *)LoginRequestWithParameters:(NSDictionary *)parameter success:(SucceedHanlder)success failure:(FailureHander)failure{
    NSString  *url = [NSString stringWithFormat:@"%@%@",BasicUrl,LoginUrl];
    return [self PostRequestWithURL:url parameters:parameter success:success failure:failure];
}
@end
