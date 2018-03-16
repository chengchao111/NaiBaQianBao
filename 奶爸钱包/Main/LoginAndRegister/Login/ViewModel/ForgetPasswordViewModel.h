//
//  ForgetPasswordViewModel.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ForgetPasswordView;
@interface ForgetPasswordViewModel : NSObject

-(void)buttonClickWithTag:(NSInteger )tag forgetPwdView:(ForgetPasswordView *)forgetPwdView withViewController:(UIViewController *)controller;
@end
