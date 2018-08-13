//
//  URMissionAddView.m
//  URMission
//
//  Created by lin weiyan on 2018/7/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMissionAddView.h"
#import "Masonry.h"
#import "URDataPickerView.h"
#import "URCommonMarco.h"
#import "NSString+Utils.h"
#import "URAlertViewUtil.h"

@interface URMissionAddView()

@property (nonatomic, strong) UITextField           *missionName;
@property (nonatomic, strong) UITextView            *missionDesc;
@property (nonatomic, strong) UIButton              *startTimeBtn;
@property (nonatomic, strong) UIButton              *endTimeBtn;
@property (nonatomic, strong) URDataPickerView      *datePicker;

@property (nonatomic, strong) NSDate                *startTime;
@property (nonatomic, strong) NSDate                *endTime;


@property (nonatomic, strong) UIButton              *okBtn;
@property (nonatomic, strong) UIButton              *cancelBtn;

@property (nonatomic, strong) UILabel               *tipLabel;

@end

@implementation URMissionAddView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initViews];
    }
    return self;
}

- (void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)initViews
{
    self.missionName = [[UITextField alloc] init];
    self.missionName.layer.borderWidth = 1;
    [self addSubview:self.missionName];
    
    [self.missionName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).mas_offset(10);
        make.top.mas_equalTo(self).mas_offset(10);
        make.trailing.mas_equalTo(self).mas_offset(-10);
        make.height.mas_equalTo(25);
    }];
    
    self.missionDesc = [[UITextView alloc] init];
    self.missionDesc.font = [UIFont systemFontOfSize:15];
    self.missionDesc.layer.borderWidth = 1;
    [self addSubview:self.missionDesc];
    
    [self.missionDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.missionName.mas_bottom).mas_offset(10);
        make.leading.mas_equalTo(self).mas_offset(10);
        make.trailing.mas_equalTo(self).mas_offset(-10);
        make.height.mas_equalTo(70);
    }];
    
    self.startTimeBtn = [[UIButton alloc] init];
    [self.startTimeBtn setTitle:@"开始时间" forState:UIControlStateNormal];
    [self.startTimeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.startTimeBtn addTarget:self action:@selector(onTimeClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.startTimeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.startTimeBtn];
    
    [self.startTimeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.missionDesc.mas_bottom).mas_offset(10);
        make.leading.mas_equalTo(15);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(30);
    }];
    
    self.endTimeBtn = [[UIButton alloc] init];
    [self.endTimeBtn setTitle:@"结束时间" forState:UIControlStateNormal];
    [self.endTimeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.endTimeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [self.endTimeBtn addTarget:self action:@selector(onTimeClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.endTimeBtn];
    
    [self.endTimeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.missionDesc.mas_bottom).mas_offset(10);
        make.trailing.mas_equalTo(-15);
        make.width.mas_equalTo(130);
        make.height.mas_equalTo(30);
    }];

    self.okBtn = [[UIButton alloc] init];
    self.okBtn.backgroundColor = [UIColor redColor];
    [self.okBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.okBtn addTarget:self action:@selector(onOKClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.okBtn];
    
    self.cancelBtn = [[UIButton alloc] init];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    self.cancelBtn.backgroundColor = [UIColor redColor];
    [self.cancelBtn addTarget:self action:@selector(onOKClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelBtn];
    
    [self.okBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self).mas_offset(-10);
        make.leading.mas_equalTo(self).mas_offset(30);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self).mas_offset(-10);
        make.trailing.mas_equalTo(self).mas_offset(-30);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];

    self.tipLabel = [[UILabel alloc] init];
    self.tipLabel.text = @"输入的内容不完整";
    self.tipLabel.font = [UIFont systemFontOfSize:13];
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    self.tipLabel.hidden = YES;
    [self addSubview:self.tipLabel];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self);
        make.trailing.mas_equalTo(self);
        make.bottom.mas_equalTo(self.okBtn.mas_top).mas_offset(-5);
        make.height.mas_equalTo(25);
    }];
}

- (void)onTimeClicked:(id)sender
{
    [self.missionName resignFirstResponder];
    [self.missionDesc resignFirstResponder];
    
    self.datePicker = [[URDataPickerView alloc] init];
    self.datePicker.backgroundColor = [UIColor whiteColor];
    
    if (sender == self.startTimeBtn) {
        self.datePicker.tag = 1;
    }
    else if (sender == self.endTimeBtn) {
        self.datePicker.tag = 2;
    }
    
    [self.superview addSubview:self.datePicker];
    
    [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.superview);
        make.size.mas_equalTo(CGSizeMake(320, 200));
        make.bottom.mas_equalTo(self.superview);
    }];
    
    WeakSelf
    self.datePicker.cancelClicked = ^{
        [weakSelf.datePicker removeFromSuperview];
        weakSelf.datePicker = nil;
    };
    
    self.datePicker.okClickedCallback = ^(NSDate *selectDate) {
        [weakSelf.datePicker removeFromSuperview];
        
        if (weakSelf.datePicker.tag == 1) {
            weakSelf.startTime = selectDate;
            [weakSelf.startTimeBtn setTitle:[URMissionAddView converData:selectDate] forState:UIControlStateNormal];
        }
        else if (weakSelf.datePicker.tag == 2) {
            weakSelf.endTime = selectDate;
            [weakSelf.endTimeBtn setTitle:[URMissionAddView converData:selectDate] forState:UIControlStateNormal];
        }
        
        weakSelf.datePicker = nil;
    };
}

- (void)onOKClicked:(id)sender
{
    if (sender == self.okBtn) {
        
        if (![self checkCondition]) {
            UIAlertController *controller = [URAlertViewUtil presentAlertView:@"" msg:@"条件不全" handler:^(BOOL isOK) {
                
            }];
            
            [[UIApplication sharedApplication].keyWindow.rootViewController.navigationController presentViewController:controller animated:YES completion:^{
                
            }];
            return ;
        }
        
        URMissionModel *missionModel = [[URMissionModel alloc] init];
        missionModel.startDate = self.startTime;
        missionModel.endDate = self.endTime;
        missionModel.missionName = self.missionName.text;
        missionModel.missionDesc = self.missionDesc.text;
        missionModel.classify = @"";
        missionModel.prioriy = 0;
        
        if (self.addMissionCallback) {
            self.addMissionCallback(missionModel);
        }
    }
    
    if (self.addDismissCallback) {
        self.addDismissCallback();
    }
}

- (BOOL)checkCondition
{
    NSString *txt = [self.missionName.text filterSpace];
    if (txt.length == 0) {
        return NO;
    }
    
    if (self.startTime == nil || self.endTime == nil) {
        return NO;
    }
    
    return YES;
}

+ (NSString *)converData:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置时间格式
    formatter.dateFormat = @"yyyy年 MM月 dd日";
    return [formatter stringFromDate:date];
}

- (void)showTipLabel
{
    self.tipLabel.hidden = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hiddenTipLabel) object:nil];
    [self performSelector:@selector(hiddenTipLabel) withObject:nil afterDelay:3];
}

- (void)hiddenTipLabel
{
    self.tipLabel.hidden = YES;
}
@end
