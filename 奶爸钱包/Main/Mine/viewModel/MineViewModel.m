//
//  MineViewModel.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/13.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "MineViewModel.h"
#import "MIneFooterView.h"
#import "MineCell.h"
#import "MIneHeaderView.h"

#import "ChangePhoneNumVC.h"
#import "MineHeaderModel.h"
@interface MineViewModel ()
@property (strong,nonatomic)NSArray *imageArray;
@property (strong,nonatomic)NSArray *titleArray;
@property (strong,nonatomic)MineHeaderModel *model;

@end



@implementation MineViewModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageArray = @[@"更换手机号",@"密码管理",@"用户协议",@"版本更新",@"关于我们",@"客服热线"];
        _titleArray = @[@"更换手机号",@"密码管理",@"用户协议",@"版本更新",@"关于我们",@"客服热线"];
        [self model];
    }
    return self;
}


-(MineHeaderModel *)model{
    if (!_model) {
        _model = [[MineHeaderModel alloc]init];
    }
    return _model;
}


-(void)reloadData:(void (^)(void))successBlock failureBlock:(void (^)(void))failureBlock{
    
    if (_model.name == nil) {
        _model.name = @"程超";
    }
    
    if (_model.phone == nil) {
        _model.phone = @"13551835013";
    }
    
    if (successBlock) {
        successBlock();
    }
    
    if (failureBlock) {
        failureBlock();
    }
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageArray.count;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 20, 0);
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mineCell" forIndexPath:indexPath];
    
    [cell cellWithImage:_imageArray[indexPath.row] title:_titleArray[indexPath.row]];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    //header
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MIneHeaderView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineHeader" forIndexPath:indexPath];
        NSLog(@"model = %@",_model);
        [header setUserModel:self.model];
        WEAKSELF(weakSelf);
        [header setHeaderBtnBlock:^(NSInteger tag) {
            [weakSelf headerBtnClick:tag];
        }];
        return header;
    }
    
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        MIneFooterView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"mineFooter" forIndexPath:indexPath];
        WEAKSELF(weakSelf);
        [footer setButtonBlock:^{
            [weakSelf footerBtnClick];
        }];
        return footer;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(Screen_W, SCREENH(225));
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    return CGSizeMake(Screen_W, SCREENH(70));
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((Screen_W)/3, SCREENH(105));
    
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (_cellSelectBlock) {
         _cellSelectBlock(indexPath.item);
    }
}

#pragma mark ---header点击事件
-(void)headerBtnClick:(NSInteger)tag{
    if (_headerSelectBlock) {
        _headerSelectBlock(tag);
    }
}


-(void)footerBtnClick{
    if (_footerSelectBlock) {
        _footerSelectBlock();
    }
}

@end
