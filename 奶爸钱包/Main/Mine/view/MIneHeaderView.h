//
//  MIneHeaderView.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/13.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MineHeaderModel;
@interface MIneHeaderView : UICollectionReusableView

@property(copy,nonatomic)void(^headerBtnBlock)(NSInteger tag);

- (void)setUserModel:(MineHeaderModel *)model;

@end
