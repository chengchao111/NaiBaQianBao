//
//  ManagerPwdView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManagerPwdView : UIView

@property (strong,nonatomic)UIButton *changeLoginPwdBtn;
@property (strong,nonatomic)UIButton *changeBargainPwdBtn;
@property (strong,nonatomic)UIButton *forgetBargainPwdBtn;

@property (copy,nonatomic)void(^buttonClick)(NSInteger tag);
@end
