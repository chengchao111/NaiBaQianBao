//
//  NextForgetBargainPwdViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/15.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextForgetBargainPwdViewModel.h"
#import "NextForgetBargainPwdView.h"
@implementation NextForgetBargainPwdViewModel

-(void)buttonClickWithNextForgetBargainPwdView:(NextForgetBargainPwdView *)view withViewController:(UIViewController *)controller{
    
    [controller.navigationController popToRootViewControllerAnimated:YES];
    
    if (view.nowPwdTf.text.length == 0) {
        [MBManager showTips:@"请输入新的交易密码"];
        return;
    }
    
    if (view.nowPwdTf.text.length != 6) {
        [MBManager showTips:@"交易密码为6位数字组成"];
        return;
    }
    
    if (view.sureNowPwdTf.text.length == 0) {
        [MBManager showTips:@"请输入新的交易密码"];
        return;
    }
    
    if (view.sureNowPwdTf.text.length != 6) {
        [MBManager showTips:@"交易密码为6位数字组成"];
        return;
    }
    
    if (![view.nowPwdTf.text isEqualToString:view.sureNowPwdTf.text]) {
        [MBManager showTips:@"两次密码输入不一样"];
        return;
    }
    
    if (view.codeTf.text.length == 0) {
        [MBManager showTips:@"请输入身份证号码"];
        return;
    }
    
    if (![RegularUtiles isUserIdCard:view.codeTf.text]) {
        [MBManager showTips:@"身份证号码不对"];
        return;
    }
    
}
@end
