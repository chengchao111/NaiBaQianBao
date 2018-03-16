//
//  BasicTabBarViewController.m
//  奶爸钱包
//
//  Created by 王毅 on 2018/3/7.
//  Copyright © 2018年 MYJF. All rights reserved.
//

#import "BasicTabBarViewController.h"
#import "HomePageVC.h"
#import "LiveVC.h"
#import "ShareVC.h"
#import "MineVC.h"
#import "PayVC.h"
#import "BasicNavgationController.h"
@interface BasicTabBarViewController ()<UINavigationControllerDelegate>

@end

@implementation BasicTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    [self setUpChildController];
    self.tabBar.alpha = 1;
    self.selectedIndex = 0;
    self.tabBar.barTintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
}



-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count > 0) {
        //隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [self pushViewController:viewController animated:YES];
}


- (void)setUpChildController
{
    //首页
    HomePageVC *homePage = [[HomePageVC alloc]init];
    BasicNavgationController *nav = [[BasicNavgationController alloc]initWithRootViewController:homePage];
    [self addChildViewController:nav itemTitle:@"有钱用" image:@"" selectImage:@"" navTitle:@"首页"];
    
    //生活
    LiveVC *live = [[LiveVC alloc]init];
    BasicNavgationController *nav1 = [[BasicNavgationController alloc]initWithRootViewController:live];
    [self addChildViewController:nav1 itemTitle:@"生活" image:@"" selectImage:@"" navTitle:@"生活"];
    
    //支付
    PayVC *pay = [[PayVC alloc]init];
    BasicNavgationController *nav2 = [[BasicNavgationController alloc]initWithRootViewController:pay];
    [self addChildViewController:nav2 itemTitle:@"支付" image:@"" selectImage:@"" navTitle:@"支付"];
    
    ShareVC *share = [[ShareVC alloc]init];
    BasicNavgationController *nav3 = [[BasicNavgationController alloc]initWithRootViewController:share];
    [self addChildViewController:nav3 itemTitle:@"分享" image:@"" selectImage:@"" navTitle:@"分享"];
    
    MineVC *mine = [[MineVC alloc]init];
    BasicNavgationController *nav4 = [[BasicNavgationController alloc]initWithRootViewController:mine];
    [self addChildViewController:nav4 itemTitle:@"我的" image:@"" selectImage:@"" navTitle:@"我的"];
    
}


-(void)addChildViewController:(UINavigationController *)childController itemTitle:(NSString *)itemTitle image:(NSString *)image selectImage:(NSString *)selectImage navTitle:(NSString *)navTitle{
    if (@available(iOS 11, *)) {
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-200, 0)
                                                             forBarMetrics:UIBarMetricsDefault];
    } else {
        [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                             forBarMetrics:UIBarMetricsDefault];
    }
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    //返回按钮的颜色
    [[UINavigationBar appearance]setTintColor:[UIColor blackColor]];
    //设置导航栏的背景色
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    childController.navigationController.navigationBarHidden = YES;
    childController .tabBarItem.title = itemTitle;
    childController.navigationBar.tintColor = COLOR(113, 113, 113);
    childController.navigationItem.title = navTitle;
    childController.tabBarItem.image = IMAGE(image);
    //需要设置照片的模式，用照片原图，默认是蓝色
    childController.tabBarItem.selectedImage = [IMAGE(selectImage) imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
     //创建修改字体颜色的字典，同时可以设置字体的那边距，默认
    NSMutableDictionary *textAtrrs = [NSMutableDictionary dictionary];
    textAtrrs[NSForegroundColorAttributeName] = COLOR(183, 183, 183);
    [childController.tabBarItem setTitleTextAttributes:textAtrrs forState:(UIControlStateNormal)];
    
    //创建修改字体颜色的字典，同时可以设置字体的那边距选中
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = COLOR(243, 105, 106);
    [childController.tabBarItem setTitleTextAttributes:selectTextAttrs forState:(UIControlStateSelected)];
    
    //添加子视图
    [self addChildViewController:childController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
