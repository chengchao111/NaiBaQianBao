//
//  MineViewModel.h
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/13.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MineViewModel,UICollectionView;
@interface MineViewModel : NSObject<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

- (void)reloadData:(void(^)(void))successBlock failureBlock:(void(^)(void))failureBlock;

@property (copy,nonatomic)void(^cellSelectBlock)(NSInteger tag);

@property (copy,nonatomic)void(^headerSelectBlock)(NSInteger tag);

@property (copy,nonatomic)void(^footerSelectBlock)(void);

@end
