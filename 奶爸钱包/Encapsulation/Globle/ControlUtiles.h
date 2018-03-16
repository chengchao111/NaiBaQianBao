//
//  ControlUtiles.h
//  MYJF
//
//  Created by 王毅 on 2018/1/22.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ControlUtiles : NSObject
//创建lable的方法，不带带位置盒行数
+ (UILabel *)createText:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor font:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment;

+ (UILabel *)createText:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor font:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment lines:(NSInteger)lines;

//创建按钮的方法

+(UIButton *)createBtnTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)font  backgroundColor:(UIColor *)color bgImageName:(NSString *)bgImageName tag:(NSInteger)tag target:(id)target action:(SEL)action;

+(UIButton *)createBtnTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)font  backgroundColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth bgImageName:(NSString *)bgImageName tag:(NSInteger)tag target:(id)target action:(SEL)action;

+(UIView *)createViewWithcornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)color;

+ (UITextField *)creatTextFiledWithTextColor:(UIColor *)textColor font:(CGFloat)font placeHolder:(NSString *)placeHolder;
//创建图片视图的方法

+(UIImageView *)createImageName:(NSString *)imageName;
//+ (UITextField *)createTextFieldWithStyle:()

#pragma marks----剪裁图片的方法
+(UIImage*)clipImage:(UIImage*)bigImage inRect:(CGRect)rect;
@end
