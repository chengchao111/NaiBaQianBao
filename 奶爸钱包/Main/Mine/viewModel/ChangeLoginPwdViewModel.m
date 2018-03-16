//
//  ChangeLoginPwdViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ChangeLoginPwdViewModel.h"
#import "ChangeLoginPwdView.h"
@implementation ChangeLoginPwdViewModel


-(void)buttonClickWithChangeLoginPwdView:(ChangeLoginPwdView *)view withViewController:(UIViewController *)controller{
    [controller.navigationController popToRootViewControllerAnimated:YES];
    
    if (view.oldPwdTf.text == nil) {
        [MBManager showTips:@"请输入当前密码"];
        return;
    }
    
    if (![RegularUtiles isPassword:view.oldPwdTf.text]) {
        [MBManager showTips:@"密码为6 - 15位字母或数字组合"];
        return;
    }
    if (view.nowPwdTf.text == nil) {
        [MBManager showTips:@"请输入新密码"];
        return;
    }
    
    if (![RegularUtiles isPassword:view.nowPwdTf.text]) {
        [MBManager showTips:@"密码为6 - 15位字母或数字组合"];
        return;
    }
    
    if (view.sureNowPwdTf.text == nil) {
        [MBManager showTips:@"请确认新密码"];
        return;
    }
    
    if (![RegularUtiles isPassword:view.sureNowPwdTf.text]) {
        [MBManager showTips:@"密码为6 - 15位字母或数字组合"];
        return;
    }
    
    if (![view.nowPwdTf.text isEqualToString:view.sureNowPwdTf.text]) {
        [MBManager showTips:@"两次密码输入不一致"];
        return;
    }
}
@end
