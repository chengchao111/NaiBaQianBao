//
//  NextChangePhoneView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/14.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "NextChangePhoneView.h"

@interface NextChangePhoneView ()
@property (strong,nonatomic)UIView *view2;
@property (strong,nonatomic)UIView *view1;
@end

@implementation NextChangePhoneView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

- (void)buttonClick{
    if (_buttonBlock) {
        _buttonBlock();
    }
}
#pragma mark--UI
- (void)setUI{

    self.backgroundColor = COLOR(236, 236, 236);
    NSArray *title = @[@"原手机号",@"新手机号"];
    
    for (int i = 0; i < 2; i ++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(SCREENW(11), SCREENH(38) + SCREENH(56) * i, SCREENW(88), SCREENH(20))];
        label.text = title[i];
        label.textAlignment = NSTextAlignmentLeft;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = COLOR(166, 166, 166);
        label.font = [UIFont systemFontOfSize:SCREENW(15)];
        [self addSubview:label];
        
        UIView *view1 = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(161, 161, 161)];
        view1.frame = CGRectMake(SCREENW(105), SCREENH(38) + SCREENH(56) * i, SCREENW(1), SCREENW(20));
        [self addSubview:view1];
        
        
        UIView *view2 = [ControlUtiles createViewWithcornerRadius:0 backgroundColor:COLOR(161, 161, 161)];
        view2.frame = CGRectMake(SCREENW(11), SCREENH(65) + SCREENH(56) * i, Screen_W - SCREENW(11), SCREENW(1));
        [self addSubview:view2];
    }
    //电话号码
    _phoneLabel = [ControlUtiles createText:@"13551835013" textColor:COLOR(118, 118, 118) backgroundColor:[UIColor clearColor] font:SCREENW(15) textAlignment:(NSTextAlignmentLeft)];
    _phoneLabel.frame = CGRectMake(SCREENW(118), SCREENH(38), SCREENW(225), SCREENH(20));
    [self addSubview:self.phoneLabel];
    
    [self addSubview:self.phoneTf];
    [self addSubview:self.sendBtn];
}

-(void)layoutSubviews{
    [self.phoneTf mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.phoneLabel.mas_top).offset(SCREENH(56));
        make.leading.mas_equalTo(self.phoneLabel.mas_leading);
        make.width.mas_equalTo(self.phoneLabel.mas_width);
        make.height.mas_equalTo(self.phoneLabel.mas_height);
    }];
    
    [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.phoneTf.mas_top).offset(SCREENH(90));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(335));
        make.height.mas_equalTo(SCREENH(48));
    }];
    
}

-(UITextField *)phoneTf{
    if (!_phoneTf) {
        _phoneTf = [ControlUtiles creatTextFiledWithTextColor:COLOR(90, 90, 90) font:SCREENW(14) placeHolder:@"请输入新的手机号"];
    }
    return _phoneTf;
}

-(UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [ControlUtiles createBtnTitle:@"提交" titleColor:[UIColor whiteColor] font:SCREENW(19) backgroundColor:COLOR(13, 99, 175) bgImageName:@"" tag:0 target:self action:@selector(buttonClick)];
    }
    return _sendBtn;
}

@end
