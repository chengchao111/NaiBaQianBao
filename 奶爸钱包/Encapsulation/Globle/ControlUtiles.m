//
//  ControlUtiles.m
//  MYJF
//
//  Created by 王毅 on 2018/1/22.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ControlUtiles.h"

@implementation ControlUtiles
#pragma mark ---创建label

+ (UILabel *)createText:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor font:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment{
    UILabel *label = [[UILabel alloc]init];
    [label setText:text];
    [label setTextColor:textColor];
    [label setBackgroundColor:backgroundColor];
    [label setFont:[UIFont systemFontOfSize:font]];
    [label setTextAlignment:textAlignment];
    return label;
}

+ (UILabel *)createText:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor font:(CGFloat)font textAlignment:(NSTextAlignment)textAlignment lines:(NSInteger)lines{
    UILabel *label = [[UILabel alloc]init];
    [label setText:text];
    [label setTextColor:textColor];
    [label setBackgroundColor:backgroundColor];
    [label setFont:[UIFont systemFontOfSize:font]];
    [label setTextAlignment:textAlignment];
    [label setNumberOfLines:lines];
    return label;
}

#pragma mark ---创建按钮
+(UIButton *)createBtnTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)font  backgroundColor:(UIColor *)color bgImageName:(NSString *)bgImageName tag:(NSInteger)tag target:(id)target action:(SEL)action

{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTag:tag];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setBackgroundColor:color];
    
    [btn.titleLabel setFont:[UIFont systemFontOfSize:font]];
    
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

+(UIButton *)createBtnTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)font  backgroundColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius borderWidth:(CGFloat)borderWidth bgImageName:(NSString *)bgImageName tag:(NSInteger)tag target:(id)target action:(SEL)action

{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTag:tag];
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    [btn setBackgroundColor:color];
    
    [btn.titleLabel setFont:[UIFont systemFontOfSize:font]];
    
    [btn.layer setCornerRadius:cornerRadius];
    
    [btn.layer setBorderWidth:borderWidth];
    
    [btn setImage:[UIImage imageNamed:bgImageName] forState:UIControlStateNormal];
 
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

+(UIView *)createViewWithcornerRadius:(CGFloat)cornerRadius backgroundColor:(UIColor *)color{
    
    UIView *view = [[UIView alloc]init];
    view.layer.cornerRadius = cornerRadius;
    view.backgroundColor = color;
    
    return view;
}


#pragma mark -- 创建textField

+ (UITextField *)creatTextFiledWithTextColor:(UIColor *)textColor font:(CGFloat)font placeHolder:(NSString *)placeHolder{
    UITextField *textFiled = [[UITextField alloc]init];
    [textFiled setTextColor:textColor];
    [textFiled setFont:[UIFont systemFontOfSize:font]];
    [textFiled setTextAlignment:(NSTextAlignmentLeft)];
    [textFiled setBorderStyle:UITextBorderStyleNone];
    [textFiled setPlaceholder:placeHolder];
    return textFiled;
}

#pragma mark----创建UIImageView
+(UIImageView *)createImageName:(NSString *)imageName

{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.image = [UIImage imageNamed:imageName];
    
    return imageView;
    
}


#pragma mark ----剪裁图片的方法

+(UIImage*)clipImage:(UIImage*)bigImage inRect:(CGRect)rect{
    
    CGImageRef imageRef =CGImageCreateWithImageInRect(bigImage.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    return image;
    
}

@end
