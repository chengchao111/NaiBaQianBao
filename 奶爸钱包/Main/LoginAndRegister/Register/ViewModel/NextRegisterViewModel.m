//
//  NextRegisterViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextRegisterViewModel.h"

@implementation NextRegisterViewModel

-(void)buttonClickWithTag:(NSInteger)tag registerView:(NextRegsiterView *)nextRegisterView withViewController:(UIViewController *)controller{
    NSLog(@"tag = %ld",(long)tag);
    if(tag == 0){
        
        if(nextRegisterView.nameTf.text.length == 0){
            [MBManager showTips:@"请输入真实姓名"];
            return;
        }
        
        if(nextRegisterView.pwdTf.text.length == 0){
            [MBManager showTips:@"请输入登录密码"];
            return;
        }
        
        if(![RegularUtiles isPassword:nextRegisterView.pwdTf.text]){
            [MBManager showTips:@"登录密码为6-15位数字或字母组合"];
            return;
        }
        if(nextRegisterView.payPwdTf.text.length == 0){
            [MBManager showTips:@"请输入支付密码"];
            return;
        }
        
        if(nextRegisterView.payPwdTf.text.length != 6){
            [MBManager showTips:@"支付密码为6位数字"];
            return;
        }
        
        if(nextRegisterView.phoneTf.text.length > 0 && ![RegularUtiles isTelNumber:nextRegisterView.phoneTf.text]){
            [MBManager showTips:@"手机号码格式不正确"];
            return;
        }
       
        //立即注册
        [controller.navigationController popToRootViewControllerAnimated:YES];
        
    }
   
    
    
}

@end
