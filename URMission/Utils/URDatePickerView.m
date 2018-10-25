//
//  URDatePickerView.m
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URDatePickerView.h"

@interface URDatePickerView()

@property (nonatomic, strong) UIButton  *okBtn;
@property (nonatomic, strong) UIButton  *cancelBtn;
@property (nonatomic, strong) UIDatePicker  *datePicker;

@end

@implementation URDatePickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.okBtn = [[UIButton alloc] init];
        [self.okBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.okBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.okBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.okBtn];
        [self.okBtn addTarget:self action:@selector(onOKClicked:)
             forControlEvents:UIControlEventTouchUpInside];
        
        self.cancelBtn = [[UIButton alloc] init];
        [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [self.cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.cancelBtn];
        [self.cancelBtn addTarget:self action:@selector(onCancelClicked:)
                 forControlEvents:UIControlEventTouchUpInside];

        self.datePicker = [[UIDatePicker alloc] init];
        self.datePicker.backgroundColor = [UIColor whiteColor];
        //设置地区: zh-中国
        self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
        //设置日期模式(Displays month, day, and year depending on the locale setting)
        self.datePicker.datePickerMode = UIDatePickerModeDate;
        // 设置当前显示时间
        [self.datePicker setDate:[NSDate date] animated:YES];
        // 设置显示最大时间（此处为当前时间）
        //    [datePicker setMaximumDate:[NSDate date]];
        //设置时间格式
        //监听DataPicker的滚动
        [self.datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.datePicker];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.okBtn.frame = CGRectMake(self.bounds.size.width - 45, 5, 40, 20);
    self.cancelBtn.frame = CGRectMake(15, 5, 40, 20);
    self.datePicker.frame = CGRectMake(0, 30, self.bounds.size.width, self.bounds.size.height - 30);
}

- (void)onOKClicked:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(onDatePickerOkClicked:)]) {
        [self.delegate onDatePickerOkClicked:self.datePicker.date];
    }
}

- (void)onCancelClicked:(UIButton *)btn
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(onDatePickerCancelClicked)]) {
        [self.delegate onDatePickerCancelClicked];
    }
}

- (void)dateChange:(UIDatePicker *)datePicker
{
//    [self.startTimeSelectView updateTime:datePicker.date];
    if (self.delegate && [self.delegate respondsToSelector:@selector(onDatePickerClicked:)]) {
        [self.delegate onDatePickerClicked:datePicker.date];
    }
}

@end
