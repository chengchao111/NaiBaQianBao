//
//  NextRegisterVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextRegisterVC.h"
#import "NextRegsiterView.h"
#import "NextRegisterViewModel.h"
@interface NextRegisterVC ()
@property (strong,nonatomic)NextRegsiterView *nextRegisterView;
@property (strong,nonatomic)NextRegisterViewModel *viewModel;
@end

@implementation NextRegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号注册";
    self.navigationController.navigationBarHidden = NO;
    self.view = self.nextRegisterView;
    WEAKSELF(weakSelf);
    [self.nextRegisterView setButtonClick:^(NSInteger tag) {
        [weakSelf.viewModel buttonClickWithTag:tag registerView:weakSelf.nextRegisterView withViewController:weakSelf];
    }];
    // Do any additional setup after loading the view.
}

-(NextRegsiterView *)nextRegisterView{
    if(!_nextRegisterView){
        _nextRegisterView = [[NextRegsiterView alloc]init];
    }
    return _nextRegisterView;
}

-(NextRegisterViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = [[NextRegisterViewModel alloc]init];
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
