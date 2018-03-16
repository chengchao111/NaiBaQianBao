//
//  ChangePhoneNumView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/13.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ChangePhoneNumView.h"

@implementation ChangePhoneNumView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)buttonClick:(UIButton *)sender{
    if (_buttonBlock) {
        _buttonBlock(sender.tag);
    }
}

- (void)setUI{
    self.backgroundColor = [UIColor whiteColor];
   
    NSArray *titleArr = @[@"手机号码",@"验证码"];

    for (int i = 0; i < 2; i ++) {

        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(SCREENW(23), SCREENH(66) + SCREENH(56) * i, SCREENW(88), SCREENH(25))];
        label.text = titleArr[i];
        label.textAlignment = NSTextAlignmentLeft;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = COLOR(166, 166, 166);
        label.font = [UIFont systemFontOfSize:SCREENW(15)];
        [self addSubview:label];
    

        
        UIView *view1 = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(161, 161, 161)];
        view1.frame = CGRectMake(SCREENW(112), SCREENH(66) + SCREENH(56) * i, SCREENW(1), SCREENW(25));
        [self addSubview:view1];
        

        UIView *view2 = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(161, 161, 161)];
        view2.frame = CGRectMake(SCREENW(23), SCREENH(95) + SCREENH(56) * i, SCREENW(328), SCREENW(1));
        [self addSubview:view2];
    }
    //电话号码
    _phoneLabel = [ControlUtiles createText:@"13551835013" textColor:COLOR(118, 118, 118) backgroundColor:[UIColor clearColor] font:SCREENW(15) textAlignment:(NSTextAlignmentLeft)];
    _phoneLabel.frame = CGRectMake(SCREENW(114), SCREENH(66), SCREENW(200), SCREENH(25));
    [self addSubview:self.phoneLabel];
    
    [self addSubview:self.codeTf];
    [self addSubview:self.codeBtn];
    [self addSubview:self.nextBtn];
    
}


-(void)layoutSubviews{
    
    [self.codeTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(SCREENW(116));
        make.top.mas_equalTo(self.mas_top).mas_offset(SCREENH(122));
        make.width.mas_equalTo(SCREENW(140));
        make.height.mas_equalTo(SCREENH(25));
    }];
    
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.codeTf.mas_right);
        make.top.mas_equalTo(self.codeTf.mas_top);
        make.height.mas_equalTo(self.codeTf.mas_height);
        make.width.mas_equalTo(SCREENW(90));
    }];
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeBtn.mas_bottom).offset(SCREENH(75));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(305));
        make.height.mas_offset(SCREENH(48));
    }];
}

#pragma make ---懒加载控件
-(UITextField *)codeTf{
    if (!_codeTf) {
        _codeTf = [ControlUtiles creatTextFiledWithTextColor:COLOR(90, 90, 90) font:SCREENH(14) placeHolder:@"输入验证码"];
    }
    return _codeTf;
}

-(UIButton *)codeBtn{
    if (!_codeBtn) {
        _codeBtn = [ControlUtiles createBtnTitle:@"获取验证码" titleColor:COLOR(0, 0, 250) font:SCREENH(14) backgroundColor:[UIColor clearColor] bgImageName:@"" tag:0 target:self action:@selector(buttonClick:)];
    }
    return _codeBtn;
}

-(UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [ControlUtiles createBtnTitle:@"下一步" titleColor:[UIColor whiteColor] font:SCREENW(19) backgroundColor:COLOR(13, 99, 175) bgImageName:@"" tag:1 target:self action:@selector(buttonClick:)];
    }
    return _nextBtn;
}


@end
