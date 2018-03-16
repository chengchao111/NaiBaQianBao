//
//  LoginView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginModel.h"
@interface LoginView : UIView
/**
 * logo图片
 */
@property (strong,nonatomic)UIImageView    *logoImage;

/**
 *头像
 */

@property (strong,nonatomic)UIImageView    *headerImage;
/**
 *添加控件的中间白色View
 */
@property (strong,nonatomic)UIView         *whiteView;
/**
 *手机号logo
 */
@property (strong,nonatomic)UIImageView       *phoneImage;
/**
 *手机号输入框
 */
@property (strong,nonatomic)UITextField    *userNameTf;
/**
 *输入框下面的下划线
 */
@property (strong,nonatomic)UIView        *userNameLine;

/**
 *密码logo
 */
@property (strong,nonatomic)UIImageView    *passwordLogo;
/**
 *验证码输入框
 */
@property (strong,nonatomic)UITextField    *passwordTf;

/**
 *显示隐藏按钮
 */
@property (strong,nonatomic)UIButton      *passwordShowBtn;

/**
 *输入框下面的下滑线
 */
@property (strong,nonatomic)UIView        *passwordLine;

/**
 *记住密码
 */
@property(strong,nonatomic)UIButton *remenberPwdBtn;

/**
 *忘记密码
 */
@property(strong,nonatomic)UIButton *forgetPwdBtn;
/**
 *登录
 */
@property (strong,nonatomic)UIButton      *loginBtn;
/**
 *没有账号label
 */
@property (strong,nonatomic)UILabel      *bottomLabel;
/**
 *返回立即去注册
 */
@property (strong,nonatomic)UIButton    *goRegister;


@property (copy,nonatomic)void(^buttonClickBlock)(NSInteger tag);

@property (strong,nonatomic)LoginModel *loginModel;
@end
