//
//  ChangePhoneNumVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/13.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ChangePhoneNumVC.h"
#import "ChangePhoneNumView.h"
#import "ChangePhoneNumViewModel.h"
@interface ChangePhoneNumVC ()

@property(nonatomic,strong)ChangePhoneNumView *mainView;
@property(nonatomic,strong)ChangePhoneNumViewModel *viewModel;
@end

@implementation ChangePhoneNumVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.view = self.mainView;
    self.title = @"更换手机号";
    
    WEAKSELF(weakSelf);
    
    self.mainView.buttonBlock = ^(NSInteger tag) {
        [weakSelf.viewModel buttonClickWithTag:tag changePhoneNumView:weakSelf.mainView withViewController:weakSelf];
    };
    
    
}

-(ChangePhoneNumViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[ChangePhoneNumViewModel alloc]init];
    }
    return _viewModel;
}

-(ChangePhoneNumView *)mainView{
    if (!_mainView) {
        _mainView = [[ChangePhoneNumView alloc]init];
    }
    return _mainView;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
