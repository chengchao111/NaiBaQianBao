//
//  RegisterView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView

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
    [self addSubview:self.phoneTf];
    [self addSubview:self.phoneLine];
    [self addSubview:self.codeTf];
    [self addSubview:self.getCodeBtn];
    [self addSubview:self.codeLine];
    [self addSubview:self.selectBtn];
    [self addSubview:self.userDelegateBtn];
    [self addSubview:self.nextBtn];
    [self addSubview:self.bottomLabel];
    [self addSubview:self.goLoginBtn];
    
}

#pragma mark --点击事件
- (void)buttonClick:(UIButton *)sender{
    
    if(_buttonClickBlock){
        _buttonClickBlock(sender.tag);
    }
}

#pragma mark --- 控件约束设置
-(void)layoutSubviews{

    //背景约束
    [self.logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.width.mas_equalTo(self.mas_width);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(SCREENH(240));
    }];

    //logo约束
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(SCREENH(30));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(76));
        make.height.mas_equalTo(SCREENH(100));
    }];

    //白色View约束
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
        make.width.mas_equalTo(SCREENW(76));
        make.height.mas_equalTo(SCREENH(26));
    }];
    
    //验证码下划线
    [self.codeLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeTf.mas_bottom).offset(SCREENH(12));
        make.leading.mas_equalTo(self.codeTf.mas_leading);
        make.width.mas_equalTo(SCREENW(265));
        make.height.mas_equalTo(SCREENH(1));
    }];
    
    //同意按钮
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeLine.mas_bottom).offset(15);
        make.leading.mas_equalTo(self.codeLine.mas_leading);
        make.height.mas_equalTo(SCREENH(20));
        make.width.mas_equalTo(SCREENH(65));
    }];
    

    [self.userDelegateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.selectBtn.mas_centerY);
        make.leading.mas_equalTo(self.selectBtn.mas_trailing);
        make.height.mas_equalTo(self.selectBtn.mas_height);
        make.width.mas_equalTo(SCREENW(180));
    }];
    //下一步
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userDelegateBtn.mas_bottom).offset(SCREENH(68));
        make.centerX.mas_equalTo(self.whiteView.mas_centerX);
        make.width.mas_equalTo(SCREENW(285));
        make.height.mas_equalTo(SCREENH(40));
    }];
    
    
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nextBtn.mas_bottom).offset(SCREENH(60));
        make.leading.mas_equalTo(self.mas_leading);
        make.width.mas_equalTo(Screen_W/2);
        make.height.mas_equalTo(SCREENH(20));
    }];
    
    [self.goLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nextBtn.mas_bottom).offset(SCREENH(60));
        make.trailing.mas_equalTo(self.mas_trailing);
        make.width.mas_equalTo(Screen_W/2);
        make.height.mas_equalTo(SCREENH(20));
    }];
    
    
}


#pragma mark -----懒加载控件
/**
 *红色背景图
 */
-(UIImageView *)logoImage{
    if (!_logoImage) {
        
        _logoImage =  [ControlUtiles createImageName:@"login_bg"];
    }
    return _logoImage;
}

/**
 *奶爸钱包logo
 */
-(UIImageView *)headerImage{
    if (!_headerImage) {
        _headerImage = [ControlUtiles createImageName:@"login_logo"];
    }
    return _headerImage;
}
/**
 *白色背景view
 */
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
        _phoneTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENW(16) placeHolder:@"请输入手机号"];
        [_phoneTf setKeyboardType:(UIKeyboardTypeNumberPad)];
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
        _codeTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENW(16) placeHolder:@"请输入验证码"];
        [_codeTf setKeyboardType:(UIKeyboardTypeNumberPad)];
    }
    
    return _codeTf;

}

/**
 *获取验证码按钮
 */
-(UIButton *)getCodeBtn{
    if (!_getCodeBtn) {
        _getCodeBtn = [ControlUtiles createBtnTitle:@"获取验证码" titleColor:COLOR(243, 55, 51) font:SCREENW(12) backgroundColor:[UIColor clearColor] cornerRadius:SCREENH(13) borderWidth:1 bgImageName:nil tag:0 target:self action:@selector(buttonClick:)];
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
 *用户协议选择按钮
 */

-(UIButton *)selectBtn{
    if (!_selectBtn) {
        _selectBtn = [ControlUtiles createBtnTitle:@"同意" titleColor:COLOR(114, 114, 114) font:SCREENW(17) backgroundColor:[UIColor clearColor] bgImageName:@"login_unselect" tag:1 target:self action:@selector(buttonClick:)];
        _selectBtn.selected = NO;
        
    }
    return _selectBtn;
}

/**
 *用户协议按钮
 */
-(UIButton *)userDelegateBtn{
    if(!_userDelegateBtn){
        _userDelegateBtn = [ControlUtiles createBtnTitle:@"《用户服务协议》" titleColor:[UIColor redColor] font:SCREENW(17) backgroundColor:[UIColor clearColor] bgImageName:nil tag:2 target:self action:@selector(buttonClick:)];
        _userDelegateBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _userDelegateBtn;
}

/**
 *下一步按钮
 */
-(UIButton *)nextBtn{
    if(!_nextBtn){
         _nextBtn = [ControlUtiles createBtnTitle:@"下一步" titleColor:[UIColor whiteColor] font:SCREENW(19) backgroundColor:COLOR(244, 101, 102) cornerRadius:SCREENH(20) borderWidth:0 bgImageName:nil tag:3 target:self action:@selector(buttonClick:)];
    }
    return _nextBtn;
}

/**
 *已有账号label
 */

-(UILabel *)bottomLabel{
    if(!_bottomLabel){
        _bottomLabel = [ControlUtiles createText:@"已有账号," textColor:COLOR(86, 86, 86) backgroundColor:[UIColor clearColor] font:SCREENW(14) textAlignment:(NSTextAlignmentRight)];
        
    }
    return _bottomLabel;
}

/**
 *返回立即登录按钮
 **/
-(UIButton *)goLoginBtn{
    if (!_goLoginBtn) {
        _goLoginBtn = [ControlUtiles createBtnTitle:@"立即登录" titleColor:COLOR(252, 0, 0) font:SCREENW(14) backgroundColor:[UIColor clearColor] bgImageName:nil tag:4 target:self action:@selector(buttonClick:)];
        _goLoginBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    }
    return _goLoginBtn;
}




@end
