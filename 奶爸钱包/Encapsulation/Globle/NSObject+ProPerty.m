//
//  NSObject+ProPerty.m
//  MYJF
//
//  Created by 王毅 on 2018/1/22.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NSObject+ProPerty.h"
#import <objc/runtime.h>
@implementation NSObject (ProPerty)

//使用runTime 获取对象的所有属性
- (NSArray *)getAllProperties
{
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i<count; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    free(properties);
    return propertiesArray;
}
@end
