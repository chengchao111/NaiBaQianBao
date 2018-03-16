//
//  ChangeLoginPwdView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangeLoginPwdView : UIView
@property (nonatomic,strong)UITextField *oldPwdTf;
@property (nonatomic,strong)UITextField *nowPwdTf;
@property (nonatomic,strong)UITextField *sureNowPwdTf;
@property (nonatomic,strong)UIButton  *sureChangeBtn;
@property (copy,nonatomic)void(^buttonBlock)(void);
@end
