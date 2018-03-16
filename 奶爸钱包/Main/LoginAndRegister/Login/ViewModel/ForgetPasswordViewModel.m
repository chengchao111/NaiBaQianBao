//
//  ForgetPasswordViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ForgetPasswordViewModel.h"
#import "ForgetPasswordView.h"
#import "NextForgetPwdVC.h"
@implementation ForgetPasswordViewModel

-(void)buttonClickWithTag:(NSInteger)tag forgetPwdView:(ForgetPasswordView *)forgetPwdView withViewController:(UIViewController *)controller{
    switch (tag) {
            case 0://获取验证码
        {
                [self getCodeWithForgetPwdView:forgetPwdView];
        }
            break;
            case 1:// 下一步
        {
            [self nextBtnClickWithViewController:controller forgetPwdview:forgetPwdView];
        }
            break;
            
        case 10:// fan hu
        {
            [controller.navigationController popViewControllerAnimated:YES];
        }
            break;
            
            
        default:
            break;
    }
}

#pragma mark -- 获取验证码
-(void)getCodeWithForgetPwdView:(ForgetPasswordView *)forgetPwdView{
    if (![RegularUtiles isTelNumber:forgetPwdView.phoneTf.text]) {
        [MBManager showTips:@"请输入正确的手机号码"];
        return;
    }
    [self startTimerWithForgetPwdView:forgetPwdView];
}

#pragma mark -- 下一步
-(void)nextBtnClickWithViewController:(UIViewController *)controller forgetPwdview:(ForgetPasswordView *)forgetPwdView{
    NextForgetPwdVC *vc = [[NextForgetPwdVC alloc]init];
    [controller.navigationController pushViewController:vc animated:YES];
    if(![RegularUtiles isTelNumber:forgetPwdView.phoneTf.text]){
        [MBManager showTips:@"手机号码格式不正确"];
        return;
    }
    
    if (forgetPwdView.phoneTf.text.length == 0) {
        [MBManager showTips:@"请输入手机号码"];
        return;
    }
    
    if (forgetPwdView.codeTf.text.length == 0) {
        [MBManager showTips:@"请输入验证码"];
        return;
    }
    if (forgetPwdView.codeTf.text.length != 4) {
        [MBManager showTips:@"验证码不正确"];
        return;
    }
    
    
}


#pragma mark ***********倒计时***********
- (void)startTimerWithForgetPwdView:(ForgetPasswordView *)forgetPasswordView{
    __block int timeout = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                
                forgetPasswordView.getCodeBtn.userInteractionEnabled = YES;
                forgetPasswordView.getCodeBtn.alpha = 0.5;
                [forgetPasswordView.getCodeBtn setTitle:@"60S" forState:(UIControlStateNormal)];
            });
            
        }else{
            
            int seconds = timeout % 60;
            
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //倒计时中
                [UIView beginAnimations:nil context:nil];
                
                [UIView setAnimationDuration:1];
                
                [forgetPasswordView.getCodeBtn setTitle:[NSString stringWithFormat:@"%@S",strTime] forState:(UIControlStateNormal)];
                
                [UIView commitAnimations];
                
                forgetPasswordView.getCodeBtn.userInteractionEnabled = NO;
                forgetPasswordView.getCodeBtn.alpha = 1;
            });
            
            timeout--;
        }
    });
    
    dispatch_resume(_timer);
    
}
@end
