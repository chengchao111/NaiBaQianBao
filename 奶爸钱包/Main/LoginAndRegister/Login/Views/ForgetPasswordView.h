//
//  ForgetPasswordView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetPasswordView : UIView
/**
 *返回按钮
 */

@property(strong,nonatomic)UIButton *backBtn;

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
 *下一步
 */
@property (strong,nonatomic)UIButton      *nextBtn;


@property (copy,nonatomic)void(^buttonClickBlock)(NSInteger tag);
@end
