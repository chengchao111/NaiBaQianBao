//
//  Utiles.h
//  MYJF
//
//  Created by 王毅 on 2018/1/22.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Utiles : NSObject

//四舍五入
+(NSString *)dataFormWithFloat:(CGFloat)floatData;

//3.时间戳转化为时间
+(NSString*)TimeTrasformWithDate:(NSString *)dateString;

//MD5加密
+ (NSString *)MD5EncryptWithString:(NSString *)data;

//sha1加密
+ (NSString *)sha1:(NSString *)input;

//字典转json
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

//压缩图片
+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

//获取AuthData
+ (id)getUserDefaultsForKey:(NSString *)key;

//保存AuthData
+ (void)setUserDefaultsObject:(id)value ForKey:(NSString *)key;

//删除NSUserdefault
+ (void)UserDefaultRemoveObjectForKey:(NSString *)key;

#pragma mark -根据字符串来动态计算label的宽高《test = 字符串，font = label。font，MaxSize = label的bounds》
+ (CGSize)labelAutoCalculateRectWith:(NSString *)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize;
@end
