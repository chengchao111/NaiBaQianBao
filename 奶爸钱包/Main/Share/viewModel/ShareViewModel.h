//
//  ShareViewModel.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/15.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShareVC;
@interface ShareViewModel : NSObject

- (void)buttonClickWithTag:(NSInteger )tag controller:(ShareVC *)controller;
@end
