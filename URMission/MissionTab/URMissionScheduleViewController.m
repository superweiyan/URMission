//
//  URMissionScheduleViewController.m
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMissionScheduleViewController.h"
#import "URNewMissionViewController.h"
#import "URCommonMarco.h"

@interface URMissionScheduleViewController ()

@end

@implementation URMissionScheduleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initViews];
    
}

- (void)initViews
{
    UIBarButtonItem *item = BarButton_Target(@"创建", self, @selector(onCreateClicked));
    self.navigationItem.rightBarButtonItem = item;
}

- (void)onCreateClicked
{
    self.navigationController.hidesBottomBarWhenPushed = YES;
    JumpViewController(@"URNewMissionViewController");
}

@end
