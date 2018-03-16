//
//  LiveVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/9.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "LiveVC.h"

@interface LiveVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong,nonatomic)UICollectionView *collectionView;
@end

@implementation LiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(UICollectionView *)collectionView{
//    if (!_collectionView) {
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//        layout.estimatedItemSize = CGSizeMake(Screen_W/2 - 10, 0);
//        _collectionView= [[UICollectionView alloc]init];
//        [_collectionView setCollectionViewLayout:layout];
//        _collectionView.delegate = self;
//        _collectionView.dataSource = self;
//    }
//    return _collectionView;
//}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
