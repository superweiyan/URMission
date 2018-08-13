//
//  URAddMissionViewController.m
//  URMission
//
//  Created by lin weiyan on 2018/7/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URAddMissionViewController.h"
#import "URCommonMarco.h"
#import "URMissionAddView.h"
#import "URMissionModule.h"

@interface URAddMissionViewController ()

@property (nonatomic, strong) URMissionAddView        *missionView;

@end

@implementation URAddMissionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    // Do any additional setup after loading the view.
        
    CGFloat top = ([UIScreen mainScreen].bounds.size.height - 360)/2 - 100;
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 300)/2;
    self.missionView = [[URMissionAddView alloc] initWithFrame:CGRectMake(x, top, 300, 1)];
    self.missionView.clipsToBounds = YES;
    [self.view addSubview:self.missionView];
    
    WeakSelf
    self.missionView.addMissionCallback = ^(URMissionModel * missionModel) {
        [[URMissionModule sharedObject] addMission:missionModel];
    };

    self.missionView.addDismissCallback = ^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    CGFloat top = ([UIScreen mainScreen].bounds.size.height - 360)/2 - 100;
    CGFloat x = ([UIScreen mainScreen].bounds.size.width - 300)/2;
    WeakSelf
    [UIView animateWithDuration:1.5 animations:^{
        weakSelf.missionView.frame = CGRectMake(x, top, 300, 360);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
