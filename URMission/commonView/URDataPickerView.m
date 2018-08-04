//
//  URDataPickerView.m
//  URMission
//
//  Created by lin weiyan on 2018/7/29.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URDataPickerView.h"
#import "Masonry.h"

@interface URDataPickerView()

@property (nonatomic, strong) UIDatePicker  *datePicker;
@property (nonatomic, strong) UIButton      *okButton;
@property (nonatomic, strong) UIButton      *closeBtn;

@end

@implementation URDataPickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)init
{
    if (self = [super init]) {
        
        self.okButton = [[UIButton alloc] init];
        self.okButton.backgroundColor = [UIColor redColor];
        [self.okButton addTarget:self action:@selector(onOKBtuClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.okButton];
        
        self.closeBtn = [[UIButton alloc] init];
        [self.closeBtn addTarget:self action:@selector(onCancelBtuClicked:) forControlEvents:UIControlEventTouchUpInside];
        self.closeBtn.backgroundColor = [UIColor blueColor];
        [self addSubview:self.closeBtn];
        
        self.datePicker = [[UIDatePicker alloc] init];
        self.datePicker.datePickerMode = UIDatePickerModeDate;
        NSLocale *locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_CN"];
        self.datePicker.locale = locale;
        [self addSubview:self.datePicker];
        [self.datePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
        
        [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).mas_offset(5);
            make.size.mas_equalTo(CGSizeMake(40, 25));
            make.trailing.mas_equalTo(self).mas_offset(-5);
        }];
        
        [self.okButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).mas_offset(5);
            make.size.mas_equalTo(CGSizeMake(40, 25));
            make.leading.mas_equalTo(self).mas_offset(5);
        }];
        
        [self.datePicker mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.closeBtn.mas_bottom).mas_offset(5);
            make.leading.mas_equalTo(self);
            make.trailing.mas_equalTo(self);
            make.bottom.mas_equalTo(self).mas_offset(-10);
        }];

    }
    return self;
}

- (void)dateChange:(UIDatePicker *)datePicker
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //设置时间格式
    formatter.dateFormat = @"yyyy年 MM月 dd日";
    NSString *dateStr = [formatter stringFromDate:datePicker.date];
    NSLog(@"+++ %@", dateStr);
}

- (void)onOKBtuClicked:(id)sender
{
    NSDate *selectDate = self.datePicker.date;
    if (self.okClickedCallback) {
        self.okClickedCallback(selectDate);
    }
    
}

- (void)onCancelBtuClicked:(id)sender
{
    if (self.cancelClicked) {
        self.cancelClicked();
    }
}


@end
