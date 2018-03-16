//
//  LoginViewController.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"
#import "RegisterViewController.h"
@interface LoginViewController ()
@property (strong,nonatomic)LoginView *loginView;
@property (strong,nonatomic)LoginViewModel *viewModel;
@property (assign,nonatomic)BOOL showSelect;
@property (assign,nonatomic)BOOL remenberSelect;
@end

@implementation LoginViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginView = [[LoginView alloc]init];
    self.view = self.loginView;
    [self buttonClick];
    
   
    
    
}


-(LoginViewModel *)viewModel{
    if (!_viewModel) {
        
        _viewModel = [[LoginViewModel alloc]init];
        
    }
    
    return _viewModel;
}

- (void)buttonClick{
    WEAKSELF(weakSelf);
    self.loginView.buttonClickBlock = ^(NSInteger tag) {
        
        [weakSelf.viewModel buttonClickWithTag:tag loginView:weakSelf.loginView withViewController:weakSelf];

    };
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
