//
//  ForgetBargainPwdView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "ForgetBargainPwdView.h"
@interface ForgetBargainPwdView()

@end

@implementation ForgetBargainPwdView

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

#pragma mark --约束
-(void)setUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
    NSArray *title = @[@"手机号码",@"验证码"];
    
    for (int i = 0; i < 2; i ++) {
        
        UILabel *label1 = [ControlUtiles createText:title[i] textColor:COLOR(173, 173, 173) backgroundColor:[UIColor clearColor] font:SCREENW(14) textAlignment:(NSTextAlignmentLeft)];
        label1.frame = CGRectMake(SCREENW(24), SCREENH(64) + SCREENH(56) * i, SCREENW(85), SCREENH(22));
        [self addSubview:label1];
        
        UILabel *label2 = [ControlUtiles createText:@"" textColor:[UIColor clearColor] backgroundColor:COLOR(191, 191, 191) font:SCREENW(14) textAlignment:(NSTextAlignmentLeft)];
        label2.frame = CGRectMake(SCREENW(24), SCREENH(100) + SCREENH(56) * i, Screen_W - SCREENW(48), SCREENH(1));
        [self addSubview:label2];
        
        UILabel *label3 = [ControlUtiles createText:@"" textColor:[UIColor clearColor] backgroundColor:COLOR(191, 191, 191) font:SCREENW(14) textAlignment:(NSTextAlignmentLeft)];
        label3.frame = CGRectMake(SCREENW(114), SCREENH(59) + SCREENH(56) * i,SCREENW(1), SCREENH(25));
        [self addSubview:label3];
        
    }
    [self addSubview:self.phoneLabel];
    [self addSubview:self.codeTf];
    [self addSubview:self.getCodeBtn];
    [self addSubview:self.nextBtn];
}

#pragma mark --控件约束
-(void)layoutSubviews{
    
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(SCREENH(64));
        make.left.mas_equalTo(self.mas_left).offset(118);
        make.right.mas_equalTo(self.mas_right).offset(-SCREENW(24));
        make.height.mas_equalTo(SCREENH(22));
    }];

    [self.codeTf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.phoneLabel.mas_top).offset(SCREENH(56));
        make.left.mas_equalTo(self.mas_left).offset(118);
        make.width.mas_equalTo(SCREENW(130));
        make.height.mas_equalTo(SCREENH(25));
    }];
    
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeTf.mas_top);
        make.left.mas_equalTo(self.codeTf.mas_right).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-SCREENW(24));
        make.height.mas_equalTo(SCREENH(25));
    }];
    
    
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.codeTf.mas_bottom).offset(SCREENH(73));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(305));
        make.height.mas_equalTo(SCREENH(SCREENH(48)));
    }];
    
    
}
#pragma mark-- 懒加载
-(UILabel *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [ControlUtiles createText:@"13551835013" textColor:COLOR(129, 129, 129) backgroundColor:[UIColor clearColor] font:SCREENW(14) textAlignment:(NSTextAlignmentLeft)];
    }
    return _phoneLabel;
}

-(UITextField *)codeTf{
    if (!_codeTf) {
        _codeTf = [ControlUtiles creatTextFiledWithTextColor:[UIColor blackColor] font:SCREENW(14) placeHolder:@"请输入验证码"];
    }
    return _codeTf;
}

-(UIButton *)getCodeBtn{
    if (!_getCodeBtn) {
        _getCodeBtn = [ControlUtiles createBtnTitle:@"获取验证码" titleColor:COLOR(41, 124, 188) font:SCREENW(13) backgroundColor:[UIColor clearColor] bgImageName:nil tag:0 target:self action:@selector(buttonClick:)];
    }
    return _getCodeBtn;
}

-(UIButton *)nextBtn{
    if (!_nextBtn) {
        _nextBtn = [ControlUtiles createBtnTitle:@"下一步" titleColor:[UIColor whiteColor] font:SCREENW(13) backgroundColor:COLOR(13, 99, 175) bgImageName:nil tag:1 target:self action:@selector(buttonClick:)];
    }
    return _nextBtn;
}



@end
