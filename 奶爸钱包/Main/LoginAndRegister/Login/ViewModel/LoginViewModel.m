//
//  LoginViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "LoginViewModel.h"
#import "CCNetWorking+UserNetWorking.h"
#import "LoginView.h"
#import "RegisterViewController.h"
#import "BasicTabBarViewController.h"
#import "ForgetPasswordVC.h"
@interface LoginViewModel()
@property (strong,nonatomic)LoginModel *loginModel;
@end

@implementation LoginViewModel


-(LoginModel *)loginModel{
    if (!_loginModel) {
        _loginModel = [[LoginModel alloc]init];
    }
    return _loginModel;
}



#pragma mark **********按钮点击事件
-(void)buttonClickWithTag:(NSInteger)tag loginView:(LoginView *)loginView withViewController:(UIViewController *)controller{

    switch (tag) {
#pragma mark --- 显示与隐藏密码
        case 0:
            {
                loginView.passwordShowBtn.selected =!loginView.passwordShowBtn.selected;
                
                if (loginView.passwordShowBtn.selected) {
                    
                    [loginView.passwordShowBtn setImage:IMAGE(@"login_eye_open") forState:(UIControlStateNormal)];
                    
                    [loginView.passwordTf setSecureTextEntry:NO];
                    
                }else{
                    
                    [loginView.passwordShowBtn setImage:IMAGE(@"login_eye_close") forState:(UIControlStateNormal)];
                    
                    [loginView.passwordTf setSecureTextEntry:YES];
                    
                }
   
            }
            break;
#pragma mark -- 记住密码
            case 1:
                {
                    loginView.remenberPwdBtn.selected =! loginView.remenberPwdBtn.selected;
                    SLog(@"%d",loginView.remenberPwdBtn.selected);
                    if (loginView.remenberPwdBtn.selected) {
                    
                        [loginView.remenberPwdBtn setImage:IMAGE(@"login_select") forState:(UIControlStateNormal)];
                        
                        //本地序列化登录密码和账号
                        [Utiles setUserDefaultsObject:loginView.userNameTf.text ForKey:USERNAME];
                        [Utiles setUserDefaultsObject:loginView.passwordTf.text ForKey:PASSWORD];
                        
                    }else{
            
                        [Utiles UserDefaultRemoveObjectForKey:PASSWORD];
                        [loginView.remenberPwdBtn setImage:IMAGE(@"login_unselect") forState:(UIControlStateNormal)];
                    }
          
                }
            break;
#pragma mark -- 忘记密码
        case 2:
            {
                [self forgotPasswordWithController:controller];
      
            }
            break;
#pragma mark -- 登录
        case 3:
            {
                [self loginWithUserName:loginView.userNameTf.text password:loginView.passwordTf.text withViewController:controller];
            
            }
            break;
#pragma mark -- 去注册
        case 4:
            {
                [self goToRegisterWithControler:controller];
            
            }
            break;
            
        default:
            break;
    }
}


#pragma mark ----登录
- (void)loginWithUserName:(NSString *)userName password:(NSString *)password withViewController:(UIViewController *)controller{
    
    
   
    
 
    BasicTabBarViewController *tabbar = [[BasicTabBarViewController alloc]init];;
    [controller presentViewController:tabbar animated:YES completion:nil];
    
    if (![RegularUtiles isTelNumber:userName]) {
        [MBManager showTips:@"手机号码格式不正确"];
        return;
    }
    
    if (userName.length == 0) {
        [MBManager showTips:@"请输入手机号码"];
        return;
    }
    
    
    
    if (password.length == 0) {
        [MBManager showTips:@"请输入密码"];
        return;
    }
    
    if (![RegularUtiles isPassword:password]) {
            [MBManager showTips:@"密码为6-15位"];
    }
    
    [MBManager showTips:@"正在登录"];
    
    NSDictionary *dic = @{@"agentId":can,@"loginId":userName,@"loginPwd":password};
    
    SLog(@" dic = %@",dic);
    [CCNetWorking LoginRequestWithParameters:dic success:^(id response) {
        
        //归档
        [self.loginModel mj_setKeyValues:response[@"data"]];
        NSString *filePath = NSHomeDirectory();
        NSString *path = [filePath stringByAppendingPathComponent:userInfoPath];
        [NSKeyedArchiver archiveRootObject:self.loginModel toFile:path];
        [MBManager showTips:response[@"respDesc"]];
//        BasicViewController *tabbar = [[BasicViewController alloc]init];
//        [controller presentViewController:tabbar animated:YES completion:nil];
    } failure:^(NSError *error) {
        
        SLog(@"error = %@",error);
        
    }];

}

#pragma mark --忘记密码
-(void)forgotPasswordWithController:(UIViewController *)controller{
    ForgetPasswordVC *vc  = [[ForgetPasswordVC alloc]init];
    [controller.navigationController pushViewController:vc animated:YES];
}

#pragma mark ---注册
- (void)goToRegisterWithControler:(UIViewController *)controller{
    RegisterViewController *vc = [[RegisterViewController alloc]init];
    [controller.navigationController pushViewController:vc animated:YES];
}
@end
