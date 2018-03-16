//
//  NextChangePhoneViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextChangePhoneViewModel.h"
#import "NextChangePhoneView.h"
@implementation NextChangePhoneViewModel

-(void)buttonClickWithNextChangePhoneNumView:(NextChangePhoneView *)view withViewController:(UIViewController *)controller{
    
    [controller.navigationController popToRootViewControllerAnimated:YES];
    
    if (![RegularUtiles isTelNumber:view.phoneTf.text]) {
        [MBManager showTips:@"手机号码不正确"];
        return;
    }
    
    if (view.phoneTf.text == nil) {
        [MBManager showTips:@"请输入新手机号码"];
        return;
    }
    
    
    
}
@end
