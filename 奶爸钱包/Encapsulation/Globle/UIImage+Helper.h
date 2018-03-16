//
//  UIImage+Helper.h
//  MYJF
//
//  Created by 王毅 on 2018/1/22.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Helper)
//翻转图片
- (UIImage *)fixOrientation;

//剪裁图片
- (UIImage *)cutImage:(UIImage*)image WithbgImageViewSize:(CGSize)size;

//压缩图片
- (UIImage *)imageWithImage:(UIImage*)image
               scaledToSize:(CGSize)newSize;
@end
