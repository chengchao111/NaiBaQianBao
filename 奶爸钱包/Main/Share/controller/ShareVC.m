//
//  ShareVC.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/15.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ShareVC.h"
#import "ShareViewModel.h"
@interface ShareVC ()
@property (strong,nonatomic)ShareViewModel *viewModel;

@property (strong,nonatomic)UIImageView *backImageView;
@property (strong,nonatomic)UIView    *whiteView;
@property (strong,nonatomic)UIButton  *button;
@property (strong,nonatomic)UIButton *shareRcodeBtn;
@end

@implementation ShareVC

-(ShareViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[ShareViewModel alloc]init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分享";
    [self.view addSubview:self.backImageView];
    [self.view addSubview:self.whiteView];
    NSArray *arr = @[@"我的视窗",@"扫码",@"微信分享",@"短信",@"QQ"];
    for (int i = 0; i < 5; i ++) {
        _button = [ControlUtiles createBtnTitle:nil titleColor:nil font:10 backgroundColor:[UIColor blackColor] bgImageName:nil tag:i target:self action:@selector(buttonClick:)];
        _button.frame = CGRectMake(CGRectGetWidth(self.whiteView.bounds)/5 * i, SCREENH(20), CGRectGetWidth(self.whiteView.bounds)/5, SCREENH(40));
        [self.whiteView addSubview:self.button];
        
        UILabel *label = [ControlUtiles createText:arr[i] textColor:COLOR(66, 65, 65) backgroundColor:[UIColor clearColor] font:SCREENW(13) textAlignment:(NSTextAlignmentCenter)];
        label.frame = CGRectMake(CGRectGetWidth(self.whiteView.bounds)/5 * i, SCREENH(60), CGRectGetWidth(self.whiteView.bounds)/5, SCREENH(20));
        [self.whiteView addSubview:label];
    }
    [self.view addSubview:self.shareRcodeBtn];
    
    
    // Do any additional setup after loading the view from its nib.
}


- (void)buttonClick:(UIButton *)sender{
    [self.viewModel buttonClickWithTag:sender.tag controller:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImageView *)backImageView{
    if (!_backImageView) {
        _backImageView = [ControlUtiles createImageName:@"share"];
        _backImageView.frame = CGRectMake(0, 0, Screen_W, Screen_H -(NaviHeight) - (TabbarHeight));
    }
    return _backImageView;
}

-(UIView *)whiteView{
    if (!_whiteView) {
        _whiteView = [ControlUtiles createViewWithcornerRadius:SCREENW(7) backgroundColor:[UIColor whiteColor]];
        _whiteView.frame = CGRectMake(SCREENW(15), SCREENH(235), Screen_W - SCREENW(30), SCREENH(82));
    }
    return _whiteView;
}

-(UIButton *)shareRcodeBtn{
    if (!_shareRcodeBtn) {
        _shareRcodeBtn = [ControlUtiles createBtnTitle:nil titleColor:[UIColor clearColor] font:1 backgroundColor:[UIColor blackColor] bgImageName:nil tag:5 target:self action:@selector(buttonClick:)];
        _shareRcodeBtn.alpha = 0.4;
        _shareRcodeBtn.frame = CGRectMake(SCREENW(100), SCREENH(440), Screen_W - SCREENW(200), SCREENH(50));
    }
    
    return _shareRcodeBtn;
}
@end
