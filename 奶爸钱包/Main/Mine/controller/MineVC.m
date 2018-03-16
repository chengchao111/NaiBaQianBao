//
//  MineVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/9.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "MineVC.h"
#import "MineViewModel.h"
#import "MIneFooterView.h"
#import "MIneHeaderView.h"
#import "MineCell.h"
#import "ChangePhoneNumVC.h"
#import "ManagerPwdVC.h"

@interface MineVC ()<UICollectionViewDelegate,UIActionSheetDelegate>
@property (strong,nonatomic)UICollectionView *collectionView;
@property (strong,nonatomic)MineViewModel *viewModel;
@property (strong,nonatomic)UIImagePickerController *imagepiker;

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = COLOR(27, 163, 231);
    [self.view addSubview:self.collectionView];
    [self reloadData];
    WEAKSELF(weakSelf);
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.viewModel reloadData:^{
            [weakSelf.collectionView.mj_header endRefreshing];
            [weakSelf.collectionView reloadData];
        }failureBlock:^{
             [weakSelf.collectionView.mj_header endRefreshing];
        }];
        
    }];
    

    [self cellClick];
   
    [self headerClick];
    
    [self footerClick];
    
    
}

#pragma --mark header点击事件
-(void)headerClick{
    WEAKSELF(weakSelf);
    [self.viewModel setHeaderSelectBlock:^(NSInteger tag) {
        switch (tag) {
            case 0:
            {
                
            }
                break;
            case 1:
            {
                
            }
                break;
            case 2://头像上传
            {
               
            }
                break;
                
            default:
                break;
        }
    }];
}

#pragma mark ---cell点击事件
-(void)cellClick{
    WEAKSELF(weakSelf);
    [self.viewModel setCellSelectBlock:^(NSInteger tag) {
        
        switch (tag) {
#pragma mark -- 更换手机号
            case 0:
            {
                ChangePhoneNumVC *vc  = [[ChangePhoneNumVC alloc]init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
                break;
#pragma mark --密码管理
            case 1:
            {
                ManagerPwdVC *vc=  [[ManagerPwdVC alloc]init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
                break;
#pragma mark --用户协议
            case 2:
            {
                
            }
                break;
#pragma mark --版本更新
            case 3:
            {
                [self toastResult:@"当前版本号:2.1.8"];
            }
                break;
#pragma mark -- 关于我们
            case 4:
            {
                
            }
                break;
#pragma mark -- 客服热线
            case 5:
            {
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",tellPhoneNummber]]];
            }
                break;
                
            default:
                break;
        }
       
    }];
}

#pragma mark --footer点击事件
-(void)footerClick{
    WEAKSELF(weakSelf);
    [self.viewModel setFooterSelectBlock:^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)reloadData{
    WEAKSELF(weakSelf);
    [self.viewModel reloadData:^{
        [weakSelf.collectionView reloadData];
        
    }failureBlock:^{
        
    }];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
    
}

-(MineViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[MineViewModel alloc]init];
    }
    return _viewModel;
}


- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,(TopHeight), Screen_W, Screen_H - (TabbarHeight)) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        if (@available(iOS 11.0, *)) {//作用是不让上面有20的空白
            
            self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            
        }
         _collectionView.alwaysBounceVertical = YES;
        _collectionView.delegate = self.viewModel;
        _collectionView.dataSource = self.viewModel;
        [_collectionView registerClass:[MineCell class] forCellWithReuseIdentifier:@"mineCell"];
        [_collectionView registerClass:[MIneHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"mineHeader"];
        [_collectionView registerClass:[MIneFooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"mineFooter"];
    }
    return _collectionView;
}



#pragma mark --版本更新
-(void)toastResult:(NSString *) toastMsg{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"提示"
                          message:toastMsg
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles:nil];
    [alert show];
}

@end
