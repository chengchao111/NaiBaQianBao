//
//  NextForgetPwdVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextForgetPwdVC.h"
#import "NextForgetPwdView.h"
#import "NextForgetPwdViewModel.h"
@interface NextForgetPwdVC ()
@property (strong,nonatomic)NextForgetPwdView *mainView;
@property (strong,nonatomic)NextForgetPwdViewModel *viewModel;
@end

@implementation NextForgetPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view  = self.mainView;
    WEAKSELF(weakSelf);
//    [weakSelf.mainView setButtonClickBlock:^(NSInteger tag) {
//        [weakSelf.viewModel buttonClickWithTag:tag nextForgetPwdView:weakSelf.mainView withViewController:weakSelf];
//    }];
    // Do any additional setup after loading the view.
}

-(NextForgetPwdView *)mainView{
    if(!_mainView){
        _mainView = [[NextForgetPwdView alloc]init];
    }
    return _mainView;
}

-(NextForgetPwdViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = [[NextForgetPwdViewModel alloc]init];
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
