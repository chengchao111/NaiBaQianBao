//
//  NextChangePhoneVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextChangePhoneVC.h"
#import "NextChangePhoneView.h"
#import "NextChangePhoneViewModel.h"
@interface NextChangePhoneVC ()
@property (strong,nonatomic)NextChangePhoneView *mainView;
@property (strong,nonatomic)NextChangePhoneViewModel *viewModel;
@end

@implementation NextChangePhoneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"输入新的手机号";
    self.view = self.mainView;
    self.mainView.buttonBlock = ^{
        
    };
    // Do any additional setup after loading the view.
}
-(NextChangePhoneView *)mainView{
    if (!_mainView) {
        _mainView = [[NextChangePhoneView alloc]init];
    }
    return _mainView;
}

-(NextChangePhoneViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[NextChangePhoneViewModel alloc]init];
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
