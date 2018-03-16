//
//  ChangeBargainPwdView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ChangeBargainPwdView.h"

@implementation ChangeBargainPwdView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}

-(void)buttonClick{
    
    if (_buttonBlock) {
        
        _buttonBlock();
    }
}

-(void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
    
    NSArray *titleArr = @[@"当前交易密码",@"更改交易密码",@"确认交易密码"];
    for (int i = 0; i < titleArr.count; i ++) {
        UILabel *label = [ControlUtiles createText:titleArr[i] textColor:COLOR(167, 167, 167) backgroundColor:[UIColor clearColor] font:SCREENW(13) textAlignment:(NSTextAlignmentCenter)];
        label.frame = CGRectMake(SCREENW(11), SCREENH(32) + SCREENH(60) * i, SCREENW(84), SCREENH(43));
        [self addSubview:label];
        
        UIView *view1 = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(156, 156, 156)];
        view1.frame = CGRectMake(SCREENW(11), SCREENH(75) + SCREENH(60) * i, Screen_W - SCREENW(11), SCREENH(1));
        [self addSubview:view1];
        
        
        UIView *view2 = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(156, 156, 156)];
        view2.frame = CGRectMake(SCREENW(115), SCREENH(42) + SCREENH(60) * i, SCREENW(1), SCREENH(23));
        [self addSubview:view2];
        
    }
    [self addSubview:self.oldPwdTf];
    [self addSubview:self.nowPwdTf];
    [self addSubview:self.sureNowPwdTf];
    
    
    
    UILabel *label1 = [ControlUtiles createText:@"交易密码由6数字组成" textColor:[UIColor blackColor] backgroundColor:[UIColor clearColor] font:SCREENW(14) textAlignment:(NSTextAlignmentCenter)];
    label1.frame = CGRectMake(0, SCREENH(215), Screen_W, SCREENH(17));
    [self addSubview:label1];
    
    [self addSubview:self.sureChangeBtn];
    
    
}

#pragma mark --控件约束
-(void)layoutSubviews{
    
    [self.oldPwdTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(SCREENH(32));
        make.left.mas_equalTo(self.mas_left).offset(SCREENW(118));
        make.trailing.mas_equalTo(self.mas_trailing);
        make.height.mas_equalTo(SCREENH(43));
    }];
    
    [self.nowPwdTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.oldPwdTf.mas_bottom).offset(SCREENH(17));
        make.left.mas_equalTo(self.mas_left).offset(SCREENW(118));
        make.trailing.mas_equalTo(self.mas_trailing);
        make.height.mas_equalTo(SCREENH(43));
    }];
    
    [self.sureNowPwdTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nowPwdTf.mas_bottom).offset(SCREENH(17));
        make.left.mas_equalTo(self.mas_left).offset(SCREENW(118));
        make.trailing.mas_equalTo(self.mas_trailing);
        make.height.mas_equalTo(SCREENH(43));
    }];
    
    [self.sureChangeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nowPwdTf.mas_bottom).offset(SCREENH(115));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(330));
        make.height.mas_equalTo(SCREENH(43));
    }];
}

#pragma mark -- 懒加载控件
-(UITextField *)oldPwdTf{
    if (!_oldPwdTf) {
        _oldPwdTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENW(15) placeHolder:@"请输入当前交易密码"];
    }
    return _oldPwdTf;
}

-(UITextField *)nowPwdTf{
    if (!_nowPwdTf) {
        _nowPwdTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENW(15) placeHolder:@"请输入更改交易密码"];
    }
    return _nowPwdTf;
}

-(UITextField *)sureNowPwdTf{
    if (!_sureNowPwdTf) {
        _sureNowPwdTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENW(15) placeHolder:@"请输入确认交易密码"];
    }
    return _sureNowPwdTf;
}

-(UIButton *)sureChangeBtn{
    if (!_sureChangeBtn) {
        _sureChangeBtn = [ControlUtiles createBtnTitle:@"确认更改" titleColor:[UIColor whiteColor] font:SCREENW(19) backgroundColor:COLOR(13, 99, 175) bgImageName:nil tag:0 target:self action:@selector(buttonClick)];
    }
    return _sureChangeBtn;
}

@end
