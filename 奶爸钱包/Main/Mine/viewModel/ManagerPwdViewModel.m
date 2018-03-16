//
//  ManagerPwdViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ManagerPwdViewModel.h"
#import "ChangeLoginPwdVC.h"
#import "ChangeBargainPwdVC.h"
#import "ForgetBargainPwdVC.h"
@implementation ManagerPwdViewModel

-(void)buttonClickWithTag:(NSInteger)tag Controller:(UIViewController *)controller{
    
    switch (tag) {
        case 0:
        {
            [self changeLoginPwdWith:controller];
        }
            break;
        case 1:
        {
            [self changeBargainPwdBtn:controller];
        }
            break;
        case 2:
        {
            [self forgetBargainPwdBtn:controller];
        }
            break;
            
        default:
            break;
    }
}

- (void)changeLoginPwdWith:(UIViewController *)controller{
    
    ChangeLoginPwdVC *vc = [[ChangeLoginPwdVC alloc]init];
    [controller.navigationController pushViewController:vc animated:YES];
}

- (void)changeBargainPwdBtn:(UIViewController *)controller{
    ChangeBargainPwdVC *vc = [[ChangeBargainPwdVC alloc]init];
    [controller.navigationController pushViewController:vc animated:YES];
}

- (void)forgetBargainPwdBtn:(UIViewController *)controller{
    ForgetBargainPwdVC *vc = [[ForgetBargainPwdVC alloc]init];
    [controller.navigationController pushViewController:vc animated:YES];
}

@end
