//
//  NextForgetPwdViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextForgetPwdViewModel.h"

@implementation NextForgetPwdViewModel

-(void)buttonClickWithTag:(NSInteger)tag nextForgetPwdView:(NextForgetPwdView *)nextForgetPwdView withViewController:(UIViewController *)controller{
    [controller.navigationController popToRootViewControllerAnimated:YES];
    if(tag == 0){
        
        if (![RegularUtiles isPassword:nextForgetPwdView.oldPwdTf.text]) {
            [MBManager showTips:@"密码为6-15位"];
            return;
        }
        
        if (nextForgetPwdView.oldPwdTf.text.length == 0) {
            [MBManager showTips:@"请输入新密码"];
            return;
        }
        
        if (![RegularUtiles isPassword:nextForgetPwdView.nowPwdTf.text]) {
            [MBManager showTips:@"密码为6-15位"];
            return;
        }
        
        if (nextForgetPwdView.nowPwdTf.text.length == 0) {
            [MBManager showTips:@"请确认新密码"];
            return;
        }
        
        if(![nextForgetPwdView.oldPwdTf.text isEqualToString:nextForgetPwdView.nowPwdTf.text]){
            [MBManager showTips:@"两次密码输入不一致"];
            return;
        }
        
        [controller.navigationController popToRootViewControllerAnimated:YES];
    }else if (tag == 10){
        
        [controller.navigationController popViewControllerAnimated:YES];
        
    }
}
@end
