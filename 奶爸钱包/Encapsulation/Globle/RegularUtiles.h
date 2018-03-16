//
//  RegularUtiles.h
//  MYJF
//
//  Created by 王毅 on 2018/1/22.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularUtiles : NSObject
#pragma 正则匹配手机号
+ (BOOL)isTelNumber:(NSString *) mobile;
#pragma 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)isPassword:(NSString *) password;
#pragma 正则匹配用户姓名,20位的中文或英文
+ (BOOL)isUserName : (NSString *) userName;
#pragma 正则匹配用户身份证号
+ (BOOL)isUserIdCard: (NSString *) idCard;
#pragma 正则匹配验证码为4位数字
+ (BOOL)isUserCode: (NSString *) Code;
#pragma 判断是否含有表情
+ (BOOL)isContainsEmoji:(NSString *)string;
@end
