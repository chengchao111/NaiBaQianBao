//
//  ForgetPasswordVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ForgetPasswordVC.h"
#import "ForgetPasswordView.h"
#import "ForgetPasswordViewModel.h"
@interface ForgetPasswordVC ()
@property (strong,nonatomic)ForgetPasswordView *forgetView;
@property (strong,nonatomic)ForgetPasswordViewModel *viewModel;
@end

@implementation ForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = self.forgetView;
    WEAKSELF(weakSelf);
     [weakSelf.forgetView setButtonClickBlock:^(NSInteger tag) {
         [weakSelf.viewModel buttonClickWithTag:tag forgetPwdView:weakSelf.forgetView withViewController:weakSelf];
     }];

}

-(ForgetPasswordView *)forgetView{
    if(!_forgetView){
        _forgetView = [[ForgetPasswordView alloc]init];
    }
    return _forgetView;
}

-(ForgetPasswordViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = [[ForgetPasswordViewModel alloc]init];
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
