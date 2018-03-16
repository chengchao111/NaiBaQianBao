//
//  ChangePhoneNumViewModel.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ChangePhoneNumView;
@interface ChangePhoneNumViewModel : NSObject
-(void)buttonClickWithTag:(NSInteger )tag changePhoneNumView:(ChangePhoneNumView *)changePhoneNumView withViewController:(UIViewController *)controller;
@end
