//
//  Utiles.m
//  MYJF
//
//  Created by 王毅 on 2018/1/22.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "Utiles.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Utiles

#pragma mark --四舍五入
+(NSString *)dataFormWithFloat:(CGFloat)floatData{
    return [NSString stringWithFormat:@"%.2f",round(floatData *100)/100];
}
#pragma mark --MD5加密
+ (NSString *)MD5EncryptWithString:(NSString *)data {
    //需要导入#import<CommonCrypto/CommonDigest.h>
    const char *cStr = [data UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (unsigned int) strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma mark ---sha1 加密

+ (NSString *)sha1:(NSString *)input{

    //需要导入#import<CommonCrypto/CommonDigest.h>
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

#pragma mark -- 字典转json,不去掉空格的
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

#pragma mark --时间戳转化为时间
+(NSString*)TimeTrasformWithDate:(NSString *)dateString
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Beijing"]];
    
    NSString *date = [formatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:dateString.integerValue/1000]];
    ////(@"date1:%@",date);
    return date;
    
}

#pragma mark --照片压缩
+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // End the context
    UIGraphicsEndImageContext();
    
    // Return the new image.
    return newImage;
}


#pragma mark -获取AuthData
+ (id)getUserDefaultsForKey:(NSString *)key
{
    if (key ==nil || [key length] <=0) {
        return nil;
    }
    id  AuthData = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return AuthData;
}

#pragma mark -保存AuthData
+ (void)setUserDefaultsObject:(id)value ForKey:(NSString *)key
{
    if (key !=nil && [key length] >0) {
        [[NSUserDefaults standardUserDefaults]setObject:value forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}
#pragma mark -删除NSUserdefault
+ (void)UserDefaultRemoveObjectForKey:(NSString *)key
{
    if (key !=nil && [key length] >0) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

#pragma mark -根据字符串来动态计算label的宽高《test = 字符串，font = label。font，MaxSize = label的bounds》
+ (CGSize)labelAutoCalculateRectWith:(NSString *)text FontSize:(CGFloat)fontSize MaxSize:(CGSize)maxSize
{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize labelSize = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading |NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;
    labelSize.height = ceil(labelSize.height);
    labelSize.width = ceil(labelSize.width);
    return labelSize;
}



@end
