//
//  NextForgetBargainPwdView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/15.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextForgetBargainPwdView : UIView

@property (strong,nonatomic)UITextField *nowPwdTf;
@property (strong,nonatomic)UITextField *sureNowPwdTf;
@property (strong,nonatomic)UITextField *codeTf;
@property (strong,nonatomic)UIButton  *sendBtn;
@property(copy,nonatomic)void(^buttonBlock)(void);
@end
