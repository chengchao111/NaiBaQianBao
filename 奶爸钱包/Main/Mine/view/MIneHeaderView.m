//
//  MIneHeaderView.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/13.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "MIneHeaderView.h"
#import "MineHeaderModel.h"
@interface MIneHeaderView()
@property (strong,nonatomic)UIImageView *backImage;
//用户信息
@property (strong,nonatomic)UIButton *userMsgBtn;

//操作手册
@property (strong,nonatomic)UIButton *operationManualBtn;
//头像
@property (strong,nonatomic)UIButton *headerBtn;
//名字和电话号码
@property (strong,nonatomic)UILabel *nameAndPhoneNum;
//认证
@property (strong,nonatomic)UILabel *certificationLabel;

@property (strong,nonatomic)MineHeaderModel *model;
@end

@implementation MIneHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
        
    }
    return self;
}

-(MineHeaderModel *)model{
    if (!_model) {
        _model = [[MineHeaderModel alloc]init];
    }
    return _model;
}

- (void)setUI{
    [self addSubview:self.backImage];
     [self addSubview:self.userMsgBtn];
     [self addSubview:self.operationManualBtn];
     [self addSubview:self.headerBtn];
     [self addSubview:self.nameAndPhoneNum];
     [self addSubview:self.certificationLabel];
    
}

-(void)setUserModel:(MineHeaderModel *)model{
    
    if (model) {
        _model = model;
//        self.headerBtn setImage: forState:<#(UIControlState)#>
        NSString *nameAndPhoneStr = [NSString stringWithFormat:@"%@  %@",model.name,model.phone];
        if (nameAndPhoneStr != nil) {
            self.nameAndPhoneNum.text = nameAndPhoneStr;
        }
        
    }
}

-(void)buttonClick:(UIButton *)sender{
    if (_headerBtnBlock) {
        _headerBtnBlock(sender.tag);
    }
}

#pragma mark -- 控件约束

-(void)layoutSubviews{
    //背景
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(self.mas_width);
        make.height.mas_equalTo(self.mas_height);
    }];
    
    //账户详情
    [self.userMsgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(20);
        make.left.mas_equalTo(self.mas_left);
        make.width.mas_equalTo(SCREENW(45));
        make.height.mas_equalTo(SCREENW(45));
    }];
    //操作手册
    [self.operationManualBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(20);
        make.right.mas_equalTo(self.mas_right);
        make.width.mas_equalTo(SCREENW(45));
        make.height.mas_equalTo(SCREENW(45));
    }];
    
    //头像
    [self.headerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SCREENH(53));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(70));
        make.height.mas_equalTo(SCREENW(70));
    }];
    
    //名字和电话
    [self.nameAndPhoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerBtn.mas_bottom);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(self.width));
        make.height.mas_equalTo(SCREENH(20));
    }];
    
    //是否认证
    [self.certificationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameAndPhoneNum.mas_bottom).offset(SCREENH(5));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(86));
        make.height.mas_equalTo(SCREENH(18));
    }];
    
}

#pragma mark --懒加载控件

-(UIImageView *)backImage{
    if (!_backImage) {
        _backImage = [ControlUtiles createImageName:@"mine_head_bg"];
    }
    return _backImage;
}

-(UIButton *)userMsgBtn{
    if (!_userMsgBtn) {
        _userMsgBtn = [ControlUtiles createBtnTitle:@"" titleColor:nil font:10 backgroundColor:[UIColor clearColor] bgImageName:@"账户详情" tag:0 target:self action:@selector(buttonClick:)];
    }
    return _userMsgBtn;
}

-(UIButton *)operationManualBtn{
    if (!_operationManualBtn) {
        _operationManualBtn = [ControlUtiles createBtnTitle:@"" titleColor:[UIColor clearColor] font:10 backgroundColor:[UIColor clearColor] bgImageName:@"操作手册" tag:1 target:self action:@selector(buttonClick:)];
    }
    return _operationManualBtn;
}

-(UIButton *)headerBtn{
    if (!_headerBtn) {
        _headerBtn = [ControlUtiles createBtnTitle:@"" titleColor:nil font:SCREENW(10) backgroundColor:[UIColor clearColor] bgImageName:@"头像" tag:2 target:self action:@selector(buttonClick:)];
    }
    return _headerBtn;
}


-(UILabel *)nameAndPhoneNum{
    if (!_nameAndPhoneNum) {
        _nameAndPhoneNum = [ControlUtiles createText:@"" textColor:[UIColor whiteColor] backgroundColor:[UIColor clearColor] font:SCREENW(14) textAlignment:(NSTextAlignmentCenter)];
    }
    return _nameAndPhoneNum;
}

-(UILabel *)certificationLabel{
    if (!_certificationLabel) {
        _certificationLabel = [ControlUtiles createText:@"" textColor:COLOR(56, 163, 233) backgroundColor:COLOR(165, 221, 245) font:SCREENW(14) textAlignment:(NSTextAlignmentCenter)];
        _certificationLabel.clipsToBounds = YES;
        _certificationLabel.layer.cornerRadius = SCREENH(9);
    }
    return _certificationLabel;
}
@end
