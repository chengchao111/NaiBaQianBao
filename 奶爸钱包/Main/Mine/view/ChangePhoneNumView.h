//
//  ChangePhoneNumView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/13.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePhoneNumView : UIView
@property (strong,nonatomic)UILabel *phoneLabel;
@property (nonatomic,strong)UITextField *codeTf;
@property (strong,nonatomic)UIButton   *codeBtn;
@property (strong,nonatomic)UIButton  *nextBtn;

@property(copy,nonatomic)void(^buttonBlock)(NSInteger tag);
@end
