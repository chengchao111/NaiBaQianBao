//
//  NextForgetBargainPwdView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/15.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextForgetBargainPwdView.h"

@implementation NextForgetBargainPwdView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)buttonClick{
    if (_buttonBlock) {
        _buttonBlock();
    }
}

#pragma mark --UI
-(void)setUI{
    self.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < 3; i ++) {
        UIView *view = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(154, 154, 154)];
        view.frame = CGRectMake(SCREENW(12), SCREENH(76) + SCREENH(56) * i, Screen_W - SCREENW(12), SCREENH(1));
        [self addSubview:view];
    }
    
    UILabel *label = [ControlUtiles createText:@"交易密码由6位数字组成" textColor:COLOR(117, 117, 117) backgroundColor:[UIColor clearColor] font:SCREENW(13) textAlignment:(NSTextAlignmentLeft)];
    label.frame = CGRectMake(SCREENW(24), SCREENH(234), Screen_W -SCREENW(48), SCREENH(20));
    [self addSubview:label];
    
    [self addSubview:self.nowPwdTf];
    
    [self addSubview:self.sureNowPwdTf];
    
    [self addSubview:self.codeTf];
    
    [self addSubview:self.sendBtn];
}

#pragma mark -- 控件约束
-(void)layoutSubviews{
    [self.nowPwdTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(SCREENH(40));
        make.width.mas_equalTo(Screen_W - SCREENW(20));
        make.height.mas_equalTo(SCREENH(35));
        make.trailing.mas_equalTo(self.mas_trailing);
    }];
    
    [self.sureNowPwdTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nowPwdTf.mas_bottom).offset(SCREENH(22));
        make.width.mas_equalTo(Screen_W - SCREENW(20));
        make.height.mas_equalTo(SCREENH(35));
        make.trailing.mas_equalTo(self.mas_trailing);
    }];
    
    [self.codeTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.sureNowPwdTf.mas_bottom).offset(SCREENH(22));
        make.width.mas_equalTo(Screen_W - SCREENW(20));
        make.height.mas_equalTo(SCREENH(35));
        make.trailing.mas_equalTo(self.mas_trailing);
    }];
    
    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeTf.mas_bottom).offset(SCREENH(86));
        make.width.mas_equalTo(Screen_W - SCREENW(22));
        make.height.mas_equalTo(SCREENH(48));
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
}


#pragma mark -- 懒加载
-(UITextField *)nowPwdTf{
    if (!_nowPwdTf) {
        _nowPwdTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENW(15) placeHolder:@"输入新的交易密码"];
        [_nowPwdTf setKeyboardType:(UIKeyboardTypeNumberPad)];
    }
    return _nowPwdTf;
}

-(UITextField *)sureNowPwdTf{
    if (!_sureNowPwdTf) {
        _sureNowPwdTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENW(15) placeHolder:@"确认新的交易密码"];
        [_sureNowPwdTf setKeyboardType:(UIKeyboardTypeNumberPad)];
    }
    return _sureNowPwdTf;
}

-(UITextField *)codeTf{
    if (!_codeTf) {
        _codeTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENW(15) placeHolder:@"请输入身份证号码"];
        [_codeTf setKeyboardType:(UIKeyboardTypeNumberPad)];
    }
    return _codeTf;
}

-(UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [ControlUtiles createBtnTitle:@"提交" titleColor:[UIColor whiteColor] font:SCREENW(18) backgroundColor:COLOR(13, 99, 175) bgImageName:nil tag:0 target:self action:@selector(buttonClick)];
    }
    return _sendBtn;
}



@end
