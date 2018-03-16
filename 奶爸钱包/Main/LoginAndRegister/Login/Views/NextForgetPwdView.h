//
//  NextForgetPwdView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextForgetPwdView : UIView

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
@property (strong,nonatomic)UITextField    *oldPwdTf;
/**
 *输入框下面的下划线
 */
@property (strong,nonatomic)UIView        *oldPwdLine;
/**
 *验证码输入框
 */
@property (strong,nonatomic)UITextField    *nowPwdTf;
/**
 *输入框下面的下滑线
 */
@property (strong,nonatomic)UIView        *nowPwdLine;

/**
 *提示lable
 */
@property (strong,nonatomic)UILabel    * descriptionLabel;

/**
 *下一步
 */
@property (strong,nonatomic)UIButton      *nextBtn;

@property (copy,nonatomic)void(^buttonClickBlock)(NSInteger tag);
@end
