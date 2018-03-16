//
//  NextRegsiterView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextRegsiterView : UIView

@property (strong,nonatomic)UITextField *nameTf;
@property (strong,nonatomic)UITextField *pwdTf;
@property (strong,nonatomic)UITextField *payPwdTf;
@property (strong,nonatomic)UITextField *phoneTf;

@property (strong,nonatomic)UIButton  *registerBtn;

@property (copy,nonatomic)void(^buttonClick)(NSInteger tag);
@end
