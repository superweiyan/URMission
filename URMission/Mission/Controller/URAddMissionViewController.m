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
#import "URNewTaskNameView.h"
#import "URNewTastTimeView.h"

@interface URAddMissionViewController ()

@property (nonatomic, strong) NSArray       *missionArray;
@property (nonatomic, assign) NSUInteger    stepIndex;

@end

@implementation URAddMissionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    self.stepIndex = 0;
    
    [self initMission];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self playAddMission:self.stepIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)initMission
{
    URNewTaskNameView *taskName = [[URNewTaskNameView alloc] initWithFrame:self.view.bounds];
    
    WeakSelf()
    taskName.callback = ^{
        weakSelf.stepIndex += 1;
        [weakSelf playAddMission:weakSelf.stepIndex];
    };
    
    URNewTastTimeView *taskTime = [[URNewTastTimeView alloc] initWithFrame:self.view.bounds];
    self.missionArray = @[taskName, taskTime];
}

- (void)playAddMission:(NSUInteger)step
{
    if (step > (self.missionArray.count - 1)) {
        return ;
    }
        
    UIView *stepView = [self.missionArray objectAtIndex:self.stepIndex];
    stepView.frame = CGRectMake(getViewWidth(), 60, getViewWidth() - 30, 300);
    [self.view addSubview:stepView];
    
    if (step > 0) {
        UIView *currentView = [self.missionArray objectAtIndex:(step - 1)];
        [UIView animateWithDuration:1 animations:^{
            currentView.frame = CGRectMake(-getViewWidth(), 60, getViewWidth() - 30, 300);
        }completion:^(BOOL finished) {
            
            [UIView animateWithDuration:1 animations:^{
                stepView.frame = CGRectMake(15, 60, getViewWidth() - 30, 300);
            }];
        }];
    }
    else {
        stepView.frame = CGRectMake(getViewWidth(), 60, getViewWidth() - 30, 300);
        [UIView animateWithDuration:1 animations:^{
            stepView.frame = CGRectMake(15, 60, getViewWidth() - 30, 300);
        }];
    }
    
}

@end
