//
//  NextForgetPwdView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/12.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextForgetPwdView.h"

@implementation NextForgetPwdView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)buttonClick:(UIButton *)sender{
    if(_buttonClickBlock){
        _buttonClickBlock(sender.tag);
}
}

- (void)setUpUI{
    [self addSubview:self.logoImage];
    [self addSubview:self.headerImage];
    [self addSubview:self.backBtn];
    [self addSubview:self.whiteView];

    [self addSubview:self.oldPwdTf];
    [self addSubview:self.oldPwdLine];
    [self addSubview:self.nowPwdTf];
    
    [self addSubview:self.nowPwdLine];
    [self addSubview:self.descriptionLabel];
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
        make.leading.mas_equalTo(self.mas_leading);
        make.height.mas_equalTo(NaviHeight);
    }];

    [self.whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImage.mas_bottom).offset(SCREENH(40));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(330));
        make.height.mas_equalTo(SCREENH(410));
    }];

    //旧密码输入框
    [self.oldPwdTf mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.mas_equalTo(self.whiteView.mas_left).offset(SCREENW(35));
        make.top.mas_equalTo(self.whiteView.mas_top).offset(SCREENH(42));
        make.width.mas_equalTo(SCREENW(265));
        make.height.mas_equalTo(SCREENH(30));
    }];

    //旧密码下划线
    [self.oldPwdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.oldPwdTf.mas_bottom).offset(SCREENH(12));
        make.leading.mas_equalTo(self.oldPwdTf.mas_leading);
        make.width.mas_equalTo(SCREENW(265));
        make.height.mas_equalTo(SCREENH(1));
    }];

    //新密码
    [self.nowPwdTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.oldPwdLine.mas_top).offset(SCREENH(16));
        make.leading.mas_equalTo(self.oldPwdLine.mas_leading);
        make.width.mas_equalTo(SCREENW(265));
        make.height.mas_equalTo(SCREENH(30));
    }];

    //新密码下划线
    [self.nowPwdLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nowPwdTf.mas_bottom).offset(SCREENH(12));
        make.leading.mas_equalTo(self.nowPwdTf.mas_leading);
        make.width.mas_equalTo(SCREENW(265));
        make.height.mas_equalTo(SCREENH(1));
    }];

    //提示信息
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nowPwdLine.mas_bottom).offset(SCREENH(25));
        make.leading.mas_equalTo(self.nowPwdLine.mas_leading);
        make.width.mas_equalTo(SCREENW(250));
        make.height.mas_equalTo(SCREENH(18));
    }];

    //下一步
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nowPwdLine.mas_bottom).offset(SCREENH(68));
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
 *新的登录密码
 */
-(UITextField *)oldPwdTf{
    
    if (!_oldPwdTf) {
        _oldPwdTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENH(16) placeHolder:@"请输入新的登录密码"];
        [_oldPwdTf addTarget:self action:@selector(textFieldChange) forControlEvents:(UIControlEventValueChanged)];
    }
    
    return _oldPwdTf;
}
/**
 *新的登录密码下划线
 */
-(UIView *)oldPwdLine{
    if (!_oldPwdLine) {
        _oldPwdLine = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(230, 230, 230)];
    }
    return _oldPwdLine;
}


/**
 *旧的登录密码
 */
-(UITextField *)nowPwdTf{
    if(!_nowPwdTf){
        _nowPwdTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENH(16) placeHolder:@"确认新的登录密码"];
    }
    
    return _nowPwdTf;
    
}

/**
 *旧的登录密码下划线
 */
-(UIView *)nowPwdLine{
    if (!_nowPwdLine) {
        _nowPwdLine = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(230, 230, 230)];
    }
    return _nowPwdLine;
}

-(UILabel *)descriptionLabel{
    if(!_descriptionLabel){
        _descriptionLabel = [ControlUtiles createText:@"登录密码由6-25位英文或数字组合" textColor:COLOR(168, 168, 168) backgroundColor:[UIColor clearColor] font:SCREENH(13) textAlignment:(NSTextAlignmentCenter)];
    }
    return _descriptionLabel;
    
}

/**
 *下一步按钮
 */
-(UIButton *)nextBtn{
    if(!_nextBtn){
        _nextBtn = [ControlUtiles createBtnTitle:@"提交" titleColor:[UIColor whiteColor] font:SCREENH(19) backgroundColor:COLOR(244, 101, 102) cornerRadius:SCREENH(20) borderWidth:0 bgImageName:nil tag:0 target:self action:@selector(buttonClick:)];
    }
    return _nextBtn;
}



@end
