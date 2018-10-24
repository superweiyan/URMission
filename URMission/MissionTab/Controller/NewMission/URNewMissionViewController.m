//
//  URNewMissionViewController.m
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URNewMissionViewController.h"
#import "Masonry.h"
#import "URCommonMarco.h"
#import "UIView+Shadow.h"
#import "URTextField.h"
#import "NewMissionToolBar.h"
#import "URDataSelectView.h"
#import "URDatePickerView.h"

@interface URNewMissionViewController ()<URDatePickerViewDelegate>

@property (nonatomic, strong) URTextField           *titleFiled;
@property (nonatomic, strong) UITextView            *descriptView;
@property (nonatomic, strong) NewMissionToolBar     *toolBar;

@property (nonatomic, strong) URDataSelectView      *startTimeSelectView;
@property (nonatomic, strong) URDataSelectView      *endTimeSelectView;
@property (nonatomic, strong) URDataSelectView      *notifyTimeSelectView;

@property (nonatomic, weak) URDatePickerView        *datePicker;

@end

@implementation URNewMissionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"添加任务";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = UIColorFromRGB(0xf3f3f3);
    
    [self initViews];
    [self initNotifications];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)initViews
{
    self.titleFiled = [[URTextField alloc] init];
    self.titleFiled.placeholder = @"输入标题";
    [self.view addSubview:self.titleFiled];
    self.titleFiled.backgroundColor = [UIColor whiteColor];
    self.titleFiled.font = [UIFont systemFontOfSize:15];
    [self.titleFiled addShadow:2];
    
    [self.titleFiled mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view).mas_offset(15);
        make.trailing.mas_equalTo(self.view).mas_offset(-15);
        make.top.mas_equalTo(self.view.mas_top).mas_offset(50);
        make.height.mas_equalTo(self.titleFiled.font.lineHeight + 10);
    }];
    
    self.descriptView = [[UITextView alloc] init];
    [self.view addSubview:self.descriptView];
    self.descriptView.font = [UIFont systemFontOfSize:15];

    [self.descriptView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleFiled.mas_bottom).mas_offset(30);
        make.leading.mas_equalTo(self.view).mas_offset(15);
        make.trailing.mas_equalTo(self.view).mas_offset(-15);
        make.height.mas_equalTo(100);
    }];
    
    UIView *shadowView = [[UIView alloc] init];
    shadowView.clipsToBounds = NO;
    shadowView.backgroundColor = [UIColor whiteColor];
    [self.view insertSubview:shadowView belowSubview:self.descriptView];
//    [self.view addSubview:shadowView];
    
    [shadowView addShadow:4];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleFiled.mas_bottom).mas_offset(30);
        make.leading.mas_equalTo(self.view).mas_offset(15);
        make.trailing.mas_equalTo(self.view).mas_offset(-15);
        make.height.mas_equalTo(100);
    }];
    
    self.startTimeSelectView = [[URDataSelectView alloc] init];
    self.startTimeSelectView.tip = @"开始时间";
    
    WeakSelf()
    self.startTimeSelectView.callback = ^{
        [weakSelf handleDateSelect:1];
    };
    [self.view addSubview:self.startTimeSelectView];
    [self.startTimeSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view).mas_offset(15);
        make.trailing.mas_equalTo(self.view).mas_offset(-15);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(self.descriptView.mas_bottom).mas_offset(15);
    }];
    
    self.endTimeSelectView = [[URDataSelectView alloc] init];
    self.endTimeSelectView.tip = @"开始时间";
    
    self.endTimeSelectView.callback = ^{
        [weakSelf handleDateSelect:2];
    };
    [self.view addSubview:self.endTimeSelectView];
    [self.endTimeSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view).mas_offset(15);
        make.trailing.mas_equalTo(self.view).mas_offset(-15);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(self.startTimeSelectView.mas_bottom).mas_offset(15);
    }];

    self.notifyTimeSelectView = [[URDataSelectView alloc] init];
    self.notifyTimeSelectView.tip = @"通知时间";
    
    self.notifyTimeSelectView.callback = ^{
        [weakSelf handleDateSelect:3];
    };
    [self.view addSubview:self.notifyTimeSelectView];
    [self.notifyTimeSelectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view).mas_offset(15);
        make.trailing.mas_equalTo(self.view).mas_offset(-15);
        make.height.mas_equalTo(30);
        make.top.mas_equalTo(self.endTimeSelectView.mas_bottom).mas_offset(15);
    }];

        
    self.toolBar = [[NewMissionToolBar alloc] init];
    [self.view addSubview:self.toolBar];
    self.toolBar.backgroundColor = [UIColor whiteColor];
    
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }
        else {
            make.bottom.mas_equalTo(self.view.mas_bottom);
        }
        make.leading.mas_equalTo(self.view);
        make.trailing.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
}

- (void)initNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onKeyboardWillHideNotification:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onKeyboardWillShowNotification:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
}

- (void)handleDateSelect:(NSUInteger)tag
{
    [self resetDataPicker];
    
    URDatePickerView *datePicker = [[URDatePickerView alloc] init];
    [self.view addSubview:datePicker];
    datePicker.tag = tag;
    datePicker.delegate = self;
    
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view);
        make.trailing.mas_equalTo(self.view);
        make.height.mas_equalTo(200);
        
        if (@available(iOS 11.0, *)) {
            make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }
        else {
            make.bottom.mas_equalTo(self.view.mas_bottom);
        }
    }];
    
    self.datePicker = datePicker;
}

- (void)onDatePickerOkClicked:(NSDate *)date
{    
    NSUInteger tag = self.datePicker.tag;
    if (tag == 1) {
        [self.startTimeSelectView updateTime:date];
    }
    else if (tag == 2) {
        [self.endTimeSelectView updateTime:date];
    }
    else if (tag == 3) {
        [self.notifyTimeSelectView updateTime:date];
    }
}

- (void)onDatePickerCancelClicked
{
    [self.datePicker removeFromSuperview];
    self.datePicker = nil;
}

//- (void)onDatePickerClicked:(NSDate *)date
//{
//    [self.startTimeSelectView updateTime:date];
//}

#pragma mark - notification

- (void)onKeyboardWillHideNotification:(NSNotification *)notification
{
    [self resetDataPicker];
}

- (void)onKeyboardWillShowNotification:(NSNotification *)notification
{
    [self resetDataPicker];
}

#pragma mark - utils

- (void)resetDataPicker
{
    [self.datePicker removeFromSuperview];
    self.datePicker = nil;
}

@end
