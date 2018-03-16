//
//  ForgetPasswordView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ForgetPasswordView.h"

@implementation ForgetPasswordView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

#pragma mark --点击事件
- (void)buttonClick:(UIButton *)sender{
    
    if(_buttonClickBlock){
        _buttonClickBlock(sender.tag);
    }
}

#pragma mark - UI
- (void)setUI{
    
    [self addSubview:self.logoImage];
    [self addSubview:self.headerImage];
    [self addSubview:self.backBtn];
    [self addSubview:self.whiteView];
    [self addSubview:self.phoneTf];
    [self addSubview:self.phoneLine];
    [self addSubview:self.codeTf];
    [self addSubview:self.getCodeBtn];
    [self addSubview:self.codeLine];
    [self addSubview:self.nextBtn];

}

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
        make.width.mas_equalTo(SCREENW(80));
        make.height.mas_equalTo(SCREENH(95));
    }];
    //返回按钮
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.width.mas_equalTo(SCREENW(80));
        make.left.mas_equalTo(self.left);
        make.height.mas_equalTo(NaviHeight);
    }];
    
    [self.whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImage.mas_bottom).offset(SCREENH(40));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(330));
        make.height.mas_equalTo(SCREENH(410));
    }];
    
    //手机号输入框
    [self.phoneTf mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.whiteView.mas_left).offset(SCREENW(35));
        make.top.mas_equalTo(self.whiteView.mas_top).offset(42);
        make.width.mas_equalTo(SCREENW(265));
        make.height.mas_equalTo(SCREENH(30));
    }];
    
    //手机号下划线
    [self.phoneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneTf.mas_bottom).offset(SCREENH(12));
        make.leading.mas_equalTo(self.phoneTf.mas_leading);
        make.width.mas_equalTo(SCREENW(265));
        make.height.mas_equalTo(SCREENH(1));
    }];
    
    //验证码
    [self.codeTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneLine.mas_top).offset(SCREENH(16));
        make.leading.mas_equalTo(self.phoneLine.mas_leading);
        make.width.mas_equalTo(SCREENW(160));
        make.height.mas_equalTo(SCREENH(26));
    }];
    
    //获取验证码按钮
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.codeTf.mas_centerY);
        make.trailing.mas_equalTo(self.phoneLine.mas_trailing);
        make.width.mas_equalTo(76);
        make.height.mas_equalTo(26);
    }];
    
    //验证码下划线
    [self.codeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeTf.mas_bottom).offset(SCREENH(12));
        make.leading.mas_equalTo(self.codeTf.mas_leading);
        make.width.mas_equalTo(SCREENW(265));
        make.height.mas_equalTo(SCREENH(1));
    }];
    
    //下一步
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeLine.mas_bottom).offset(SCREENH(68));
        make.centerX.mas_equalTo(self.whiteView.mas_centerX);
        make.width.mas_equalTo(SCREENW(285));
        make.height.mas_equalTo(SCREENH(40));
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

-(UIButton *)backBtn{
    
    if (!_backBtn) {
        _backBtn = [ControlUtiles createBtnTitle:nil titleColor:nil font:18 backgroundColor:[UIColor clearColor] bgImageName:@"back" tag:10 target:self action:@selector(buttonClick:)];
        _backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    return _backBtn;
}

-(UIView *)whiteView{
    if (!_whiteView) {
        _whiteView = [ControlUtiles createViewWithcornerRadius:SCREENH(8) backgroundColor:[UIColor whiteColor]];
    }
    return _whiteView;
}


/**
 *手机号输入框
 */
-(UITextField *)phoneTf{
    
    if (!_phoneTf) {
        _phoneTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENH(16) placeHolder:@"请输入手机号"];
        [_phoneTf addTarget:self action:@selector(textFieldChange) forControlEvents:(UIControlEventValueChanged)];
    }
    
    return _phoneTf;
}
/**
 *手机号输入框下划线
 */
-(UIView *)phoneLine{
    if (!_phoneLine) {
        _phoneLine = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(230, 230, 230)];
    }
    return _phoneLine;
}


/**
 *验证码输入框
 */
-(UITextField *)codeTf{
    if(!_codeTf){
        _codeTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENH(16) placeHolder:@"请输入验证码"];
    }
    
    return _codeTf;
    
}

/**
 *获取验证码按钮
 */
-(UIButton *)getCodeBtn{
    if (!_getCodeBtn) {
        _getCodeBtn = [ControlUtiles createBtnTitle:@"获取验证码" titleColor:COLOR(243, 55, 51) font:SCREENH(12) backgroundColor:[UIColor clearColor] cornerRadius:SCREENH(13) borderWidth:1 bgImageName:nil tag:0 target:self action:@selector(buttonClick:)];
        _getCodeBtn.layer.borderColor = COLOR(243, 55, 51).CGColor;
        _getCodeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    }
    return _getCodeBtn;
}

/**
 *验证码输入框下划线
 */
-(UIView *)codeLine{
    if (!_codeLine) {
        _codeLine = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(230, 230, 230)];
    }
    return _codeLine;
}

/**
 *下一步按钮
 */
-(UIButton *)nextBtn{
    if(!_nextBtn){
        _nextBtn = [ControlUtiles createBtnTitle:@"下一步" titleColor:[UIColor whiteColor] font:SCREENH(19) backgroundColor:COLOR(244, 101, 102) cornerRadius:SCREENH(20) borderWidth:0 bgImageName:nil tag:1 target:self action:@selector(buttonClick:)];
    }
    return _nextBtn;
}
@end
