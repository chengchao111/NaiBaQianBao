//
//  NextForgetPwdViewModel.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NextForgetPwdView.h"
@interface NextForgetPwdViewModel : NSObject
-(void)buttonClickWithTag:(NSInteger )tag nextForgetPwdView:(NextForgetPwdView *)nextForgetPwdView withViewController:(UIViewController *)controller;
@end
