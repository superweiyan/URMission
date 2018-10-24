//
//  URNavigateController.m
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URNavigateController.h"

@interface URNavigateController ()

@end

@implementation URNavigateController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count == 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if(self.childViewControllers.count == 2) {
        UIViewController *viewController = self.childViewControllers.firstObject;
        viewController.hidesBottomBarWhenPushed = NO;
    }
    
    return [super popViewControllerAnimated:animated];
}


- (nullable NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    UIViewController *viewController = self.childViewControllers.firstObject;
    viewController.hidesBottomBarWhenPushed = NO;
    return [super popToRootViewControllerAnimated:animated];
}

@end
