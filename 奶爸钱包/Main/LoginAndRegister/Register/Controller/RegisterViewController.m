//
//  RegisterViewController.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/8.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "ResgiterViewModel.h"
@interface RegisterViewController ()
@property (strong,nonatomic)RegisterView *registerView;
@property (strong,nonatomic)ResgiterViewModel *viewModel;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view = self.registerView;
     WEAKSELF(weakSelf);
     [self.registerView setButtonClickBlock:^(NSInteger tag) {
        [weakSelf.viewModel buttonClickWithTag:tag registerView:weakSelf.registerView withViewController:weakSelf];
     }];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

-(RegisterView *)registerView{
    if(!_registerView){
        _registerView = [[RegisterView alloc]init];
    }
    return _registerView;
}

-(ResgiterViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = [[ResgiterViewModel alloc]init];
    }
    return _viewModel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
