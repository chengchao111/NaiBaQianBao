//
//  LoginModel.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject
//用户名
@property (strong,nonatomic)NSString *merName;
//是否实名认证
@property (strong,nonatomic)NSString *isAuthentication;
//注册时间
@property (strong,nonatomic)NSString *currentDate;
//最后一次登陆时间
@property (strong,nonatomic)NSString *lastLoginDate;
//用户ID
@property (strong,nonatomic)NSString *merId;
//sessionId
@property (strong,nonatomic)NSString *sessionId;



@end
