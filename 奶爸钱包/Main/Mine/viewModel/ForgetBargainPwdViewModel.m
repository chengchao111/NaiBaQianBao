//
//  ForgetBargainPwdViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ForgetBargainPwdViewModel.h"
#import "ForgetBargainPwdView.h"
#import "NextForgetBargainPwdVC.h"
@implementation ForgetBargainPwdViewModel


-(void)buttonClickWithTag:(NSInteger)tag ForgetBargainPwdView:(ForgetBargainPwdView *)view withViewController:(UIViewController *)controller{
    
    if (tag == 0) {
        [self getCodeWith:view];
    }else if (tag == 1){
        [self nextWithView:view controller:controller];
    }
}

#pragma mark --获取验证码
- (void)getCodeWith:(ForgetBargainPwdView *)view{
    [self startTimerWithForgetBargainPwdView:view];
}

#pragma mark --下一步
- (void)nextWithView:(ForgetBargainPwdView *)view controller:(UIViewController *)controller{
    
    NextForgetBargainPwdVC *vc = [[NextForgetBargainPwdVC alloc]init];
    [controller.navigationController pushViewController:vc animated:YES];
    if (view.codeTf.text.length != 4) {
        [MBManager showTips:@"验证码不正确"];
        return;
    }

}

#pragma mark ***********倒计时***********
- (void)startTimerWithForgetBargainPwdView:(ForgetBargainPwdView *)view{
    __block int timeout = 59; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        
        if(timeout <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置界面的按钮显示 根据自己需求设置
                
                view.getCodeBtn.userInteractionEnabled = YES;
                view.getCodeBtn.alpha = 0.5;
                [view.getCodeBtn setTitle:@"60S" forState:(UIControlStateNormal)];
            });
            
        }else{
            
            int seconds = timeout % 60;
            
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //倒计时中
                [UIView beginAnimations:nil context:nil];
                
                [UIView setAnimationDuration:1];
                
                [view.getCodeBtn setTitle:[NSString stringWithFormat:@"%@S",strTime] forState:(UIControlStateNormal)];
                
                [UIView commitAnimations];
                
                view.getCodeBtn.userInteractionEnabled = NO;
                view.getCodeBtn.alpha = 1;
            });
            
            timeout--;
        }
    });
    
    dispatch_resume(_timer);
    
}
@end
