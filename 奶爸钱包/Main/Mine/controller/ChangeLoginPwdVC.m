//
//  ChangeLoginPwdVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ChangeLoginPwdVC.h"
#import "ChangeLoginPwdView.h"
#import "ChangeLoginPwdViewModel.h"
@interface ChangeLoginPwdVC ()
@property (nonatomic,strong)ChangeLoginPwdViewModel *viewModel;
@property (nonatomic,strong)ChangeLoginPwdView  *mainView;
@end

@implementation ChangeLoginPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更改登录密码";
    self.view = self.mainView;
    WEAKSELF(weakSelf);
    self.mainView.buttonBlock = ^{
        [weakSelf.viewModel buttonClickWithChangeLoginPwdView:weakSelf.mainView withViewController:weakSelf];
    };
    
}

-(ChangeLoginPwdView *)mainView{
    if (!_mainView) {
        _mainView = [[ChangeLoginPwdView alloc]init];
    }
    return _mainView;
}

-(ChangeLoginPwdViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[ChangeLoginPwdViewModel alloc]init];
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
