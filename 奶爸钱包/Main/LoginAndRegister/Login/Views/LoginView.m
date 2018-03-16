//
//  LoginView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "LoginView.h"
#import <Masonry.h>
@interface LoginView ()
@end

@implementation LoginView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

#pragma mark ---UI
- (void)setUI{
    self.backgroundColor = COLOR(254, 242, 242);
    [self addSubview:self.logoImage];
    [self addSubview:self.headerImage];
    [self addSubview:self.whiteView];
    [self addSubview:self.phoneImage];
    [self addSubview:self.userNameTf];
    [self addSubview:self.userNameLine];
    [self addSubview:self.passwordLogo];
    [self addSubview:self.passwordTf];
    [self addSubview:self.passwordLine];
    [self addSubview:self.passwordShowBtn];
    [self addSubview:self.remenberPwdBtn];
    [self addSubview:self.forgetPwdBtn];
    [self addSubview:self.loginBtn];
    [self addSubview:self.bottomLabel];
    [self addSubview:self.goRegister];
    
}


#pragma mark ---按钮点击事件
- (void)buttonClick:(UIButton *)sender{
    if (_buttonClickBlock) {
        _buttonClickBlock(sender.tag);
    }
}

-(void)textFieldChange{
    if (_userNameTf.text.length > 11) {
        [MBManager showTips:@"手机号码最大为11位"];
        _userNameTf.text = [_userNameTf.text substringToIndex:11];
        return;
    }
    
    if (_passwordTf.text.length > 15) {
        [MBManager showTips:@"密码最大为15位"];
        _passwordTf.text = [_passwordTf.text substringToIndex:15];
        return;
    }
}


#pragma mark ---约束添加
-(void)layoutSubviews{
    
    [self.logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.width.mas_equalTo(self.mas_width);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(SCREENH(240));
    }];
    
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(SCREENH(30));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(76));
        make.height.mas_equalTo(SCREENW(100));
    }];
    
    [self.whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImage.mas_bottom).offset(SCREENH(40));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(330));
        make.height.mas_equalTo(SCREENH(410));
    }];
    
    [self.phoneImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.whiteView.mas_top).offset(SCREENH(40));
        make.left.mas_equalTo(self.whiteView.mas_left).offset(SCREENW(36));
        make.width.mas_equalTo(SCREENW(13));
        make.height.mas_equalTo(SCREENH(16));
    }];
    
    [self.userNameTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.phoneImage.mas_centerY);
        make.leading.mas_equalTo(self.phoneImage.mas_trailing).offset(SCREENW(12));
        make.width.mas_equalTo(SCREENW(240));
        make.height.mas_equalTo(SCREENH(30));
    }];
    
    [self.userNameLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.whiteView.mas_top).offset(SCREENH(70));
        make.leading.mas_equalTo(self.phoneImage.mas_leading);
        make.width.mas_equalTo(SCREENW(262));
        make.height.mas_equalTo(SCREENH(1));
    }];
    
    [self.passwordLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userNameLine.mas_top).offset(SCREENH(18));
        make.leading.mas_equalTo(self.phoneImage.mas_leading);
        make.width.mas_equalTo(SCREENW(13));
        make.height.mas_equalTo(SCREENH(16));
    }];
    
    [self.passwordTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.passwordLogo.mas_centerY);
        make.leading.mas_equalTo(self.passwordLogo.mas_trailing).offset(12);
        make.width.mas_equalTo(SCREENW(220));
        make.height.mas_equalTo(SCREENH(30));
    }];
    
    [self.passwordLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTf.mas_bottom).offset(SCREENH(10));
        make.leading.mas_equalTo(self.passwordLogo.mas_leading);
        make.width.mas_equalTo(SCREENW(262));
        make.height.mas_equalTo(SCREENH(1));
    }];
    
    [self.passwordShowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.passwordTf.mas_centerY);
        make.trailing.mas_equalTo(self.passwordLine.mas_trailing).offset(3);
        make.width.mas_equalTo(SCREENW(28));
        make.height.mas_equalTo(SCREENH(20));
    }];

    [self.remenberPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordLine.mas_top).offset(SCREENH(10));
        make.leading.mas_equalTo(self.passwordLine.mas_leading);
        make.width.mas_equalTo(SCREENW(100));
        make.height.mas_equalTo(SCREENH(20));
    }];

    [self.forgetPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordLine.mas_top).offset(SCREENH(10));
        make.trailing.mas_equalTo(self.passwordLine.mas_trailing);
        make.width.mas_equalTo(SCREENW(100));
        make.height.mas_equalTo(SCREENH(20));
    }];

    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordLine.mas_top).offset(SCREENH(67));
        make.centerX.mas_equalTo(self.passwordLine.mas_centerX);
        make.width.mas_equalTo(SCREENW(285));
        make.height.mas_equalTo(SCREENH(40));
    }];
    
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(SCREENH(60));
        make.leading.mas_equalTo(self.mas_leading);
        make.width.mas_equalTo(Screen_W/2);
        make.height.mas_equalTo(SCREENH(20));
    }];
    
    [self.goRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(SCREENH(60));
        make.trailing.mas_equalTo(self.mas_trailing);
        make.width.mas_equalTo(Screen_W/2);
        make.height.mas_equalTo(SCREENH(20));
    }];
    
    
}

#pragma mark -- 懒加载控件
-(UIImageView *)logoImage{
    if (!_logoImage) {
        
        _logoImage =  [ControlUtiles createImageName:@"login_bg"];
    }
    return _logoImage;
}

-(UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [ControlUtiles createImageName:@"login_logo"];
    }
    return _headerImage;
}

-(UIView *)whiteView{
    if (!_whiteView) {
        _whiteView = [ControlUtiles createViewWithcornerRadius:SCREENH(8) backgroundColor:[UIColor whiteColor]];
    }
    return _whiteView;
}

-(UIImageView *)phoneImage{
    
    if (!_phoneImage) {
        _phoneImage = [ControlUtiles createImageName:@"login_phone"];
    }
    return _phoneImage;
}

-(UITextField *)userNameTf{
    
    if (!_userNameTf) {
        _userNameTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENW(16) placeHolder:@"请输入手机号"];
        [_userNameTf addTarget:self action:@selector(textFieldChange) forControlEvents:(UIControlEventValueChanged)];
        if ([Utiles getUserDefaultsForKey:USERNAME] != nil) {
            SLog(@"user = %@",[Utiles getUserDefaultsForKey:USERNAME]);
            _userNameTf.text = [Utiles getUserDefaultsForKey:USERNAME];
        }
    }
    
    return _userNameTf;
}


-(UIView *)userNameLine{
    if (!_userNameLine) {
        _userNameLine = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(230, 230, 230)];
    }
    return _userNameLine;
}

-(UIImageView *)passwordLogo{
    if (!_passwordLogo) {
        _passwordLogo = [ControlUtiles createImageName:@"login_pwd"];
    }
    return _passwordLogo;
}


-(UITextField *)passwordTf{
    if (!_passwordTf) {
        _passwordTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENH(16) placeHolder:@"请输入密码"];
         [_passwordTf addTarget:self action:@selector(textFieldChange) forControlEvents:(UIControlEventValueChanged)];
        [_passwordTf setSecureTextEntry:YES];
        if ([Utiles getUserDefaultsForKey:PASSWORD] != nil) {
            _passwordTf.text = [Utiles getUserDefaultsForKey:PASSWORD];
        }
    }
    return _passwordTf;
}

-(UIView *)passwordLine{
    if (!_passwordLine) {
        _passwordLine = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(230, 230, 230)];
    }
    return _passwordLine;
}

-(UIButton *)passwordShowBtn{
    
    if (!_passwordShowBtn) {
         _passwordShowBtn = [ControlUtiles createBtnTitle:nil titleColor:nil font:SCREENW(14) backgroundColor:[UIColor clearColor] bgImageName:@"login_eye_close" tag:0 target:self action:@selector(buttonClick:)];
        _passwordShowBtn.selected = NO;
    }
    return _passwordShowBtn;
    
}



-(UIButton *)remenberPwdBtn{
    if (!_remenberPwdBtn) {
        _remenberPwdBtn = [ControlUtiles createBtnTitle:@"记住密码" titleColor:COLOR(114, 114, 114) font:SCREENW(14) backgroundColor:[UIColor clearColor] bgImageName:@"login_select" tag:1 target:self action:@selector(buttonClick:)];
        _remenberPwdBtn.selected = YES;
        
    }
    return _remenberPwdBtn;
}

-(UIButton *)forgetPwdBtn{
    if (!_forgetPwdBtn) {
        _forgetPwdBtn = [ControlUtiles createBtnTitle:@"忘记密码?" titleColor:COLOR(114, 114, 114) font:SCREENW(14) backgroundColor:[UIColor clearColor] bgImageName:nil tag:2 target:self action:@selector(buttonClick:)];
        
    }
    return _forgetPwdBtn;
}

-(UIButton *)loginBtn{
    
    if (!_loginBtn) {
        _loginBtn = [ControlUtiles createBtnTitle:@"登录" titleColor:[UIColor whiteColor] font:SCREENH(19) backgroundColor:COLOR(244, 101, 102) cornerRadius:SCREENH(20) borderWidth:0 bgImageName:nil tag:3 target:self action:@selector(buttonClick:)];
    }
    return _loginBtn;
}

-(UILabel *)bottomLabel{
    
    if (!_bottomLabel) {
        _bottomLabel = [ControlUtiles createText:@"还没有账号？" textColor:COLOR(114, 114, 114) backgroundColor:[UIColor clearColor] font:SCREENW(14) textAlignment:(NSTextAlignmentRight)];
        
    }
    return _bottomLabel;
}

-(UIButton *)goRegister{
    if (!_goRegister) {
        _goRegister = [ControlUtiles createBtnTitle:@"点击注册" titleColor:COLOR(252, 0, 0) font:SCREENW(14) backgroundColor:[UIColor clearColor] bgImageName:nil tag:4 target:self action:@selector(buttonClick:)];
        _goRegister.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _goRegister;
}






@end
