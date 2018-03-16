//
//  BasicNavgationController.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "BasicNavgationController.h"

@interface BasicNavgationController ()

@end

@implementation BasicNavgationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        //隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:YES];
}

@end
