//
//  ManagerPwdView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ManagerPwdView.h"

@implementation ManagerPwdView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}


-(void)buttonClick:(UIButton *)sender{
    if (_buttonClick) {
        _buttonClick(sender.tag);
    }
}
#pragma mark -- UI
- (void)setUI{
    self.backgroundColor = COLOR(232, 232, 232);
    [self addSubview:self.changeLoginPwdBtn];
    [self addSubview:self.changeBargainPwdBtn];
    [self addSubview:self.forgetBargainPwdBtn];
}

#pragma mark --约束
-(void)layoutSubviews{
    [self.changeLoginPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(SCREENH(48));
    }];
    
    [self.changeBargainPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.changeLoginPwdBtn.mas_bottom).offset(SCREENH(1));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(SCREENH(48));
    }];
    
    [self.forgetBargainPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.changeBargainPwdBtn.mas_bottom).offset(SCREENH(1));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(SCREENH(48));
    }];
}

#pragma mark--懒加载
-(UIButton *)changeLoginPwdBtn{
    if (!_changeLoginPwdBtn) {
        _changeLoginPwdBtn = [ControlUtiles createBtnTitle:@"更改登录密码" titleColor:[UIColor blackColor] font:SCREENW(15) backgroundColor:[UIColor whiteColor] bgImageName:nil tag:0 target:self action:@selector(buttonClick:)];
    }
    return _changeLoginPwdBtn;
}

-(UIButton *)changeBargainPwdBtn{
    if (!_changeBargainPwdBtn) {
        _changeBargainPwdBtn = [ControlUtiles createBtnTitle:@"更改交易密码" titleColor:[UIColor blackColor] font:SCREENW(15) backgroundColor:[UIColor whiteColor] bgImageName:nil tag:1 target:self action:@selector(buttonClick:)];
    }
    return _changeBargainPwdBtn;
}

-(UIButton *)forgetBargainPwdBtn{
    if (!_forgetBargainPwdBtn) {
        _forgetBargainPwdBtn = [ControlUtiles createBtnTitle:@"忘记交易密码" titleColor:[UIColor blackColor] font:SCREENW(15) backgroundColor:[UIColor whiteColor] bgImageName:nil tag:2 target:self action:@selector(buttonClick:)];
    }
    return _forgetBargainPwdBtn;
}

@end
