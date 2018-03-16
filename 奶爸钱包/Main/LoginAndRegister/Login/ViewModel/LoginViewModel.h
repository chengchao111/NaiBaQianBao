//
//  LoginViewModel.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"
@class LoginView;
@interface LoginViewModel : NSObject

//按钮点击
-(void)buttonClickWithTag:(NSInteger )tag loginView:(LoginView *)loginView withViewController:(UIViewController *)controller;

@end

