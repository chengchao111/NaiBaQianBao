//
//  ResgiterViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ResgiterViewModel.h"
#import "NextRegisterVC.h"
@implementation ResgiterViewModel

- (void)buttonClickWithTag:(NSInteger)tag registerView:(RegisterView *)registerView withViewController:(UIViewController *)controller{
    switch (tag) {
            case 0://获取验证码
        {
            [self getCodeWithRegisterView:registerView];
        }
            break;
            case 1://是否同意用户协议
        {
            [self selectUserDelegateWithRegisterView:registerView];
        }
            break;
            case 2://用户协议
        {
            [self gotoUserDelegateWithController:controller];
        }
            break;
            case 3://下一步
        {
            [self nextBtnClickWithViewController:controller withRegisterView:registerView];
        }
            break;
            case 4://返回登录页面
        {
            [self gotoLoginWithViewController:controller];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark --获取验证码
-(void)getCodeWithRegisterView:(RegisterView *)registerView{
    if (![RegularUtiles isTelNumber:registerView.phoneTf.text]) {
        [MBManager showTips:@"请输入正确的手机号"];
        return;
    }
    //开始计时
    [self startTimerWithRegisterView:registerView];
    
}


#pragma mark --是否同意用户协议
-(void)selectUserDelegateWithRegisterView:(RegisterView *)registerView{
    registerView.selectBtn.selected =! registerView.selectBtn.selected;
    if(registerView.selectBtn.selected){
        
        [registerView.selectBtn setImage:IMAGE(@"login_select") forState:(UIControlStateNormal)];
    }else{
        
        [registerView.selectBtn setImage:IMAGE(@"login_unselect") forState:(UIControlStateNormal)];
    }
}

#pragma mark--去看用户协议
-(void)gotoUserDelegateWithController:(UIViewController *)controller{
    
}

#pragma mark -- 下一步
-(void)nextBtnClickWithViewController:(UIViewController *)controller withRegisterView:(RegisterView *)registerView{
    NextRegisterVC *vc = [[NextRegisterVC alloc]init];
    [controller.navigationController pushViewController:vc animated:YES];
    if(![RegularUtiles isTelNumber:registerView.phoneTf.text]){
        [MBManager showTips:@"手机号码格式不正确"];
        return;
    }
    
    if (registerView.phoneTf.text.length == 0) {
        [MBManager showTips:@"请输入手机号码"];
        return;
    }

    if (registerView.codeTf.text.length == 0) {
        [MBManager showTips:@"请输入验证码"];
        return;
    }
    if (registerView.codeTf.text.length != 4) {
        [MBManager showTips:@"验证码不正确"];
        return;
    }
    
    if(!registerView.selectBtn.selected){
        [MBManager showTips:@"请勾选用户协议"];
        return;
    }
    
   
}

#pragma mark --立即登录
- (void)gotoLoginWithViewController:(UIViewController *)controller{
    [controller.navigationController popViewControllerAnimated:YES];
}


#pragma mark ***********倒计时***********
- (void)startTimerWithRegisterView:(RegisterView *)registerView{
    __block int timeout = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                
                registerView.getCodeBtn.userInteractionEnabled = YES;
                registerView.getCodeBtn.alpha = 0.5;
                [registerView.getCodeBtn setTitle:@"60S" forState:(UIControlStateNormal)];
            });
            
        }else{
            
            int seconds = timeout % 60;
            
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{

                //倒计时中
                [UIView beginAnimations:nil context:nil];
                
                [UIView setAnimationDuration:1];

                [registerView.getCodeBtn setTitle:[NSString stringWithFormat:@"%@S",strTime] forState:(UIControlStateNormal)];
                
                [UIView commitAnimations];
                
                registerView.getCodeBtn.userInteractionEnabled = NO;
                registerView.getCodeBtn.alpha = 1;
            });
            
            timeout--;
        }
    });
    
    dispatch_resume(_timer);
    
}

@end
