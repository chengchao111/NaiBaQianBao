//
//  CCDefines.h
//  MYJF
//
//  Created by 王毅 on 2018/1/22.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#ifndef CCDefines_h
#define CCDefines_h

#define WEAKSELF(weakSelf)    __weak __typeof(&*self) weakSelf = self

#define UUID [[[UIDevice currentDevice] identifierForVendor] UUIDString]

//图片设置
#define IMAGE(image) [UIImage imageNamed:image]

//获取屏幕宽高
#define Screen_W [UIScreen mainScreen].bounds.size.width
#define Screen_H [UIScreen mainScreen].bounds.size.height


#define Is_Iphone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define Is_Iphone_X (Is_Iphone && Screen_H == 812.0)
#define NaviHeight Is_Iphone_X ? 88 : 64
#define TopHeight  Is_Iphone_X ? 44 : 0
#define TabbarHeight Is_Iphone_X ? 83 : 49
#define BottomHeight Is_Iphone_X ? 34 : 0

//获取屏幕比例
#define SCREENW(X) [[UIScreen mainScreen] bounds].size.width / 375 *(X)
#define SCREENH(Y) [[UIScreen mainScreen] bounds].size.height / 667 *(Y)

//自定义颜色
#define COLOR(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]


#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#endif /* CCDefines_h */
