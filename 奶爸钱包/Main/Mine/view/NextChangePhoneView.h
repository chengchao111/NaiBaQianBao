//
//  NextChangePhoneView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NextChangePhoneView : UIView
@property (nonatomic,strong)UILabel *phoneLabel;
@property (nonatomic,strong)UITextField *phoneTf;
@property (strong,nonatomic)UIButton *sendBtn;

@property (copy,nonatomic)void(^buttonBlock)(void);
@end
