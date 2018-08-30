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
@property (nonatomic, assign) NSUInteger     stepIndex;

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
    
    [self playAddMission];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)initMission
{
    URNewTaskNameView *taskName = [[URNewTaskNameView alloc] initWithFrame:CGRectMake(getViewWidth(), 60, 300, 300)];
    [taskName updateHeadline:@"写下任务的名字"];
    WeakSelf()
    taskName.optCallback = ^(BOOL isForward) {
        [weakSelf handleTaskItem:isForward];
    };
    
    URNewTastTimeView *taskTime = [[URNewTastTimeView alloc] initWithFrame:CGRectMake(getViewWidth(), 60, 300, 500)];
    taskTime.optCallback = ^(BOOL isForward) {
        [weakSelf handleTaskItem:isForward];
    };

    self.missionArray = @[taskName, taskTime];
}

- (void)handleTaskItem:(BOOL)isForward
{
    if (isForward) {
        
        if (self.stepIndex == (self.missionArray.count - 1)) {
            
        }
        else {
            self.stepIndex += 1;
            [self playAddMission];
        }
    }
    else {
        if (self.stepIndex == 0) {
            self.popCallback();
        }
        else {
            [self playDrawBack];
        }
    }
}

- (void)playDrawBack
{
    if (self.stepIndex == 0) {
        return ;
    }
    
    URNewBaseTaskView *stepView = [self.missionArray objectAtIndex:self.stepIndex];
    self.stepIndex -= 1;
    
    CGRect rect = stepView.frame;
    WeakSelf()
    [UIView animateWithDuration:0.5 animations:^{
        stepView.frame = CGRectMake(getViewWidth(), rect.origin.y, rect.size.width, rect.size.height);
    }completion:^(BOOL finished) {
        UIView *currentView = [weakSelf.missionArray objectAtIndex:weakSelf.stepIndex];
        [UIView animateWithDuration:0.5 animations:^{
            currentView.frame = CGRectMake((getViewWidth() - rect.size.width)/2,
                                           rect.origin.y,
                                           rect.size.width,
                                           rect.size.height);
        }];
    }];
}

- (void)playAddMission
{
    if (self.stepIndex > (self.missionArray.count - 1)) {
        return ;
    }
        
    URNewBaseTaskView *stepView = [self.missionArray objectAtIndex:self.stepIndex];
    CGRect rect = stepView.frame;
    
    stepView.frame = CGRectMake(getViewWidth(), rect.origin.y, rect.size.width, rect.size.height);
    [self.view addSubview:stepView];
    
    if (self.stepIndex > 0) {
        URNewBaseTaskView *currentView = [self.missionArray objectAtIndex:(self.stepIndex - 1)];
        [currentView resignFirstResponder];
        
        CGRect currentRect = currentView.frame;
        [UIView animateWithDuration:0.5 animations:^{
            currentView.frame = CGRectMake(-getViewWidth(), currentRect.origin.y, currentRect.size.width, currentRect.size.height);
        }completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.5 animations:^{
                stepView.frame = CGRectMake((getViewWidth() - rect.size.width)/2, rect.origin.y, rect.size.width, rect.size.height);
            }];
        }];
    }
    else {
        stepView.frame = CGRectMake((getViewWidth() - rect.size.width)/2, rect.origin.y, rect.size.width, rect.size.height);
        [UIView animateWithDuration:1 animations:^{
            stepView.frame = CGRectMake((getViewWidth() - rect.size.width)/2, rect.origin.y, rect.size.width, rect.size.height);
        }];
    }
    
}

@end
