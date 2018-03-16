//
//  CALayer+FrameHelper.m
//  CellDeleteTest
//
//  Created by iOS on 17/2/22.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "CALayer+FrameHelper.h"
#import <objc/message.h>

@implementation CALayer (FrameHelper)

- (void)setX:(float)x{
    
    objc_setAssociatedObject(self, @"x", @(x), OBJC_ASSOCIATION_ASSIGN);
    
    self.frame = CGRectMake(x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    
}

- (float)x{
    
    return self.frame.origin.x;
    
}

- (void)setY:(float)y{
    
    objc_setAssociatedObject(self, @"y", @(y), OBJC_ASSOCIATION_ASSIGN);
    
    self.frame = CGRectMake(self.frame.origin.x, y, self.frame.size.width, self.frame.size.height);
    
}

- (float)y{
    
    return self.frame.origin.y;
    
}

- (void)setWidth:(float)width{
    
    objc_setAssociatedObject(self, @"width", @(width), OBJC_ASSOCIATION_ASSIGN);
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    
}

- (float)width{
    
    return self.frame.size.width;
    
}

- (void)setHeight:(float)height{
    
    objc_setAssociatedObject(self, @"height", @(height), OBJC_ASSOCIATION_ASSIGN);
    
    self.frame = CGRectMake(self.x, self.y, self.width, height);
    
}

- (float)height{
    
    return self.frame.size.height;
    
}

@end
