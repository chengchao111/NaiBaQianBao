//
//  ForgetBargainPwdVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ForgetBargainPwdVC.h"
#import "ForgetBargainPwdView.h"
#import "ForgetBargainPwdViewModel.h"
@interface ForgetBargainPwdVC ()
@property (strong,nonatomic)ForgetBargainPwdView *mainView;
@property (strong,nonatomic)ForgetBargainPwdViewModel *viewModel;
@end

@implementation ForgetBargainPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记交易密码";
    self.view = self.mainView;
    
    WEAKSELF(weakSelf);
    self.mainView.buttonBlock = ^(NSInteger tag) {
      
        [weakSelf.viewModel buttonClickWithTag:tag ForgetBargainPwdView:weakSelf.mainView withViewController:weakSelf];
    };
    // Do any additional setup after loading the view.
}

-(ForgetBargainPwdView *)mainView{
    if (!_mainView) {
        _mainView = [[ForgetBargainPwdView alloc]init];
    }
    return _mainView;
}

-(ForgetBargainPwdViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[ForgetBargainPwdViewModel alloc]init];
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
