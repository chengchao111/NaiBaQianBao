//
//  NextForgetBargainPwdVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/15.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextForgetBargainPwdVC.h"
#import "NextForgetBargainPwdView.h"
#import "NextForgetBargainPwdViewModel.h"
@interface NextForgetBargainPwdVC ()
@property(strong,nonatomic)NextForgetBargainPwdView *mainView;
@property (strong,nonatomic)NextForgetBargainPwdViewModel *viewModel;
@end

@implementation NextForgetBargainPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"输入新密码";
    self.view = self.mainView;
    WEAKSELF(weakSelf);
    self.mainView.buttonBlock = ^{
        
        [weakSelf.viewModel buttonClickWithNextForgetBargainPwdView:weakSelf.mainView withViewController:weakSelf];
    };
}

-(NextForgetBargainPwdView *)mainView{
    if (!_mainView) {
        _mainView = [[NextForgetBargainPwdView alloc]init];
    }
    return _mainView;
}

-(NextForgetBargainPwdViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[NextForgetBargainPwdViewModel alloc]init];
    }
    return _viewModel;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
