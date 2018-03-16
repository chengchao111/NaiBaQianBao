//
//  MIneFooterView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/13.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "MIneFooterView.h"
@interface MIneFooterView()
@property (strong,nonatomic)UIButton *button;
@end
@implementation MIneFooterView

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

- (void)setUI{
    [self addSubview:self.button];
}

-(void)layoutSubviews{
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.mas_equalTo(SCREENW(325));
        make.height.mas_equalTo(SCREENH(48));
    }];
}

#pragma mark --懒加载控件
-(UIButton *)button{
    if (!_button) {
        _button = [ControlUtiles createBtnTitle:@"退出登录" titleColor:[UIColor whiteColor] font:SCREENH(19) backgroundColor:COLOR(27, 163, 231) cornerRadius:SCREENH(8) borderWidth:0 bgImageName:nil tag:0 target:self action:@selector(buttonClick)];
    }
    return _button;
}

@end
