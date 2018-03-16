
//
//  ChangeBargainPwdVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ChangeBargainPwdVC.h"
#import "ChangeBargainPwdView.h"
#import "ChangeBargainPwdViewModel.h"
@interface ChangeBargainPwdVC ()
@property (strong,nonatomic)ChangeBargainPwdView *mainView;
@property (strong,nonatomic)ChangeBargainPwdViewModel *viewModel;
@end

@implementation ChangeBargainPwdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更改交易密码";
    self.view = self.mainView;
    WEAKSELF(weakSelf);
    self.mainView.buttonBlock = ^{
        [weakSelf.viewModel buttonClickWithChangeBargainPwdView:weakSelf.mainView withViewController:weakSelf];
    };
    // Do any additional setup after loading the view.
}
-(ChangeBargainPwdView *)mainView{
    if (!_mainView) {
        _mainView = [[ChangeBargainPwdView alloc]init];
    }
    return _mainView;
}

-(ChangeBargainPwdViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[ChangeBargainPwdViewModel alloc]init];
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
