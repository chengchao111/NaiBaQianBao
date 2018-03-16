//
//  RegisterView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView
/**
 * logo图片
 */
@property (strong,nonatomic)UIImageView    *logoImage;

/**
 *头像
 */
@property (strong,nonatomic)UIImageView   *headerImage;
/**
 *添加控件的中间白色View
 */
@property (strong,nonatomic)UIView        *whiteView;
/**
 *手机号输入框
 */
@property (strong,nonatomic)UITextField    *phoneTf;
/**
 *输入框下面的下划线
 */
@property (strong,nonatomic)UIView        *phoneLine;
/**
 *验证码输入框
 */
@property (strong,nonatomic)UITextField    *codeTf;
/**
 *输入框下面的下滑线
 */
@property (strong,nonatomic)UIView        *codeLine;

/**
 *获取验证码按钮
 */
@property (strong,nonatomic)UIButton    * getCodeBtn;

/**
 *同意用户协议选中按钮
 */
@property (strong,nonatomic)UIButton      *selectBtn;

/**
 *用户协议
 */
@property (strong,nonatomic)UIButton      *userDelegateBtn;

/**
 *下一步
 */
@property (strong,nonatomic)UIButton      *nextBtn;

/**
 *已有账号label
 */
@property (strong,nonatomic)UILabel      *bottomLabel;

/**
 *返回立即登录按钮
 */
@property (strong,nonatomic)UIButton    *goLoginBtn;


@property (copy,nonatomic)void(^buttonClickBlock)(NSInteger tag);
@end
