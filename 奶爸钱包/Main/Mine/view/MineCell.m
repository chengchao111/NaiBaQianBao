//
//  MineCell.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/13.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "MineCell.h"

@interface MineCell()

@property (strong,nonatomic)UIImageView *imageView;
@property (strong,nonatomic)UILabel   *title;

@end

@implementation MineCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)cellWithImage:(NSString *)image title:(NSString *)title{
    
    if (title) {
        self.title.text = title;
    }
    
    if (image) {
        self.imageView.image = IMAGE(image);
    }
    
}
#pragma mark --UI

- (void)setUI
{
    [self addSubview:self.imageView];
    [self addSubview:self.title];
}

-(void)layoutSubviews{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(SCREENH(14));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(SCREENW(50));
        make.height.mas_equalTo(SCREENW(50));
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(self.width);
        make.height.mas_equalTo(SCREENW(17));
    }];
}

#pragma mark -- 懒加载控件
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [ControlUtiles createImageName:@""];
    }
    return _imageView;
}

-(UILabel *)title{
    if (!_title) {
        _title = [ControlUtiles createText:@"" textColor:COLOR(48, 48, 48) backgroundColor:[UIColor clearColor] font:SCREENW(15) textAlignment:(NSTextAlignmentCenter)];
    }
    return _title;
}
@end
