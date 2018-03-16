//
//  ManagerPwdVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ManagerPwdVC.h"
#import "ManagerPwdView.h"
#import "ManagerPwdViewModel.h"
@interface ManagerPwdVC ()

@property (strong,nonatomic)ManagerPwdView *mainView;
@property (strong,nonatomic)ManagerPwdViewModel *viewModel;
@end

@implementation ManagerPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view = self.mainView;
    self.title = @"密码管理";

    WEAKSELF(weakSelf);
    self.mainView.buttonClick = ^(NSInteger tag) {
      
        [weakSelf.viewModel buttonClickWithTag:tag Controller:weakSelf];
        
    };
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = NO;
}

-(ManagerPwdViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[ManagerPwdViewModel alloc]init];
    }
    return _viewModel;
}

-(ManagerPwdView *)mainView{
    if (!_mainView) {
        _mainView = [[ManagerPwdView alloc]init];
    }
    return _mainView;
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
