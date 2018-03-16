//
//  ForgetBargainPwdView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetBargainPwdView : UIView

@property (strong,nonatomic)UILabel *phoneLabel;

@property (strong,nonatomic)UITextField *codeTf;

@property (strong,nonatomic)UIButton   *getCodeBtn;

@property (strong,nonatomic)UIButton  *nextBtn;

@property (copy,nonatomic)void(^buttonBlock)(NSInteger tag);

@end
