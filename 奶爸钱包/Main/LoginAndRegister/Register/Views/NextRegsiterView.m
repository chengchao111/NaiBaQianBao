//
//  NextRegsiterView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextRegsiterView.h"

@implementation NextRegsiterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
        
    }
    return self;
}

- (void)setUI{

    self.backgroundColor = [UIColor whiteColor];
    
    NSArray *imageName = @[@"login_user",@"login_pwd",@"login_pay_pwd",@"login_friend"];
   
    for (int i = 0; i < 4; i ++) {
        //下划线
        UIView *view = [[UIView alloc]init];
        view.backgroundColor = COLOR(206, 206, 206);
        view.bounds = CGRectMake(0, 0, SCREENW(276), SCREENH(1));
        view.center = CGPointMake(Screen_W/2, SCREENH(60) + (NaviHeight) + SCREENH(53) * i);
        [self addSubview:view];
        
        //小图标
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREENW(55), SCREENH(26) + (NaviHeight) + SCREENH(54) * i, SCREENW(14), SCREENH(17))];
        imageView.image = IMAGE(imageName[i]);
        [self addSubview:imageView];
        
    }
    
    UILabel *label = [ControlUtiles createText:@"登录密码由6-15位数字或字母组成\n交易密码由6位数字组成" textColor:COLOR(180, 180, 180) backgroundColor:[UIColor clearColor] font:SCREENW(15) textAlignment:(NSTextAlignmentLeft) lines:2];
    label.frame = CGRectMake(SCREENW(56), SCREENH(260) + (NaviHeight), SCREENW(240),SCREENH(36));
    [self addSubview:label];
    
    [self addSubview:self.nameTf];
    [self addSubview:self.pwdTf];
    [self addSubview:self.payPwdTf];
    [self addSubview:self.phoneTf];
    
    [self addSubview:self.registerBtn];
    
}

-(void)layoutSubviews{

    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.top.mas_equalTo(SCREENH(380) + (NaviHeight));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(285));
        make.height.mas_equalTo(SCREENH(40));
    }];
    
    [self.nameTf mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(SCREENH(25) + (NaviHeight));
        make.left.mas_equalTo(self.mas_left).offset(SCREENW(75));
        make.width.mas_equalTo(SCREENW(285));
        make.height.mas_equalTo(SCREENH(25));
    }];
    
    [self.pwdTf mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(SCREENH(78) + (NaviHeight));
        make.left.mas_equalTo(self.mas_left).offset(SCREENW(75));
        make.width.mas_equalTo(SCREENW(285));
        make.height.mas_equalTo(SCREENH(25));
    }];
    
    [self.payPwdTf mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(SCREENH(130) + (NaviHeight));
        make.left.mas_equalTo(self.mas_left).offset(SCREENW(75));
        make.width.mas_equalTo(SCREENW(285));
        make.height.mas_equalTo(SCREENH(25));
    }];
    
    [self.phoneTf mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(SCREENH(182) + (NaviHeight));
        make.left.mas_equalTo(self.mas_left).offset(SCREENW(75));
        make.width.mas_equalTo(SCREENW(285));
        make.height.mas_equalTo(SCREENH(25));
    }];
    
  
    
}


- (UIButton *)registerBtn{
    if(!_registerBtn){
         _registerBtn = [ControlUtiles createBtnTitle:@"立即注册" titleColor:[UIColor whiteColor] font:SCREENW(19) backgroundColor:COLOR(244, 101, 102) cornerRadius:SCREENH(20) borderWidth:0 bgImageName:nil tag:0 target:self action:@selector(buttonClick:)];
    }
    return _registerBtn;
    
}

-(UITextField *)nameTf{
    if(!_nameTf){
        _nameTf = [ControlUtiles creatTextFiledWithTextColor:COLOR(112, 112, 112) font:SCREENW(14) placeHolder:@"请输入真实姓名"];
    }
    return _nameTf;
}

-(UITextField *)pwdTf{
    if(!_pwdTf){
        _pwdTf = [ControlUtiles creatTextFiledWithTextColor:COLOR(112, 112, 112) font:SCREENW(14) placeHolder:@"登录密码由6-15位字母或数字组成"];
    }
    return _pwdTf;
}

-(UITextField *)payPwdTf{
    if(!_payPwdTf){
        _payPwdTf = [ControlUtiles creatTextFiledWithTextColor:COLOR(112, 112, 112) font:SCREENW(14) placeHolder:@"交易密码由6位数字组成"];
        [_payPwdTf setKeyboardType:(UIKeyboardTypeNumberPad)];
    }
    return _payPwdTf;
}

-(UITextField *)phoneTf{
    if(!_phoneTf){
        _phoneTf = [ControlUtiles creatTextFiledWithTextColor:COLOR(112, 112, 112) font:SCREENW(14) placeHolder:@"请输入推荐人手机号"];
        [_phoneTf setKeyboardType:(UIKeyboardTypeNumberPad)];
    }
    return _phoneTf;
}

- (void)buttonClick:(UIButton *)sender{
    if(_buttonClick){
        _buttonClick(sender.tag);
    }
}


@end
