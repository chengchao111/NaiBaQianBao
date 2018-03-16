
//
//  ChangeBargainPwdViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ChangeBargainPwdViewModel.h"
#import "ChangeBargainPwdView.h"

@implementation ChangeBargainPwdViewModel
-(void)buttonClickWithChangeBargainPwdView:(ChangeBargainPwdView *)view withViewController:(UIViewController *)controller{
    
    [controller.navigationController popToRootViewControllerAnimated:YES];
    if (view.oldPwdTf.text == nil) {
        [MBManager showTips:@"请输入当前交易密码"];
        return;
    }
    
    if (view.nowPwdTf.text.length != 6) {
        [MBManager showTips:@"交易密码为6数字组合"];
        return;
    }
    if (view.nowPwdTf.text == nil) {
        [MBManager showTips:@"请输入新交易密码"];
        return;
    }
    
    if (view.nowPwdTf.text.length != 6) {
        [MBManager showTips:@"交易密码为6数字组合"];
        return;
    }
    
    if (view.sureNowPwdTf.text == nil) {
        [MBManager showTips:@"请确认新交易密码"];
        return;
    }
    
    if (view.nowPwdTf.text.length != 6) {
        [MBManager showTips:@"交易密码为6数字组合"];
        return;
    }
    
    if (![view.nowPwdTf.text isEqualToString:view.sureNowPwdTf.text]) {
        [MBManager showTips:@"两次交易密码输入不一致"];
        return;
    }
}
@end
