//
//  URMissionAddView.m
//  URMission
//
//  Created by lin weiyan on 2018/7/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMissionAddView.h"
#import "Masonry.h"

@interface URMissionAddView()

@property (nonatomic, strong) UITextField           *missionName;
@property (nonatomic, strong) UITextView            *missionDesc;
@property (nonatomic, strong) UIDatePicker          *startPicker;
@property (nonatomic, strong) UIDatePicker          *endPicker;

@end

@implementation URMissionAddView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)showMissionView
{
    URMissionAddView *missionView = [[URMissionAddView alloc] initWithFrame:CGRectMake(0, 0, 300, 500)];
    missionView.backgroundColor = [UIColor whiteColor];
    return missionView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews
{
    self.missionName = [[UITextField alloc] init];
    [self addSubview:self.missionName];
    
    [self.missionName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self).mas_offset(10);
        make.top.mas_equalTo(self).mas_offset(10);
        make.trailing.mas_equalTo(self).mas_offset(-10);
        make.height.mas_equalTo(25);
    }];
    
    self.missionDesc = [[UITextView alloc] init];
    self.missionDesc.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.missionDesc];
    
    [self.missionDesc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.missionName.mas_bottom).mas_offset(10);
        make.leading.mas_equalTo(self).mas_offset(10);
        make.trailing.mas_equalTo(self).mas_offset(-10);
        make.height.mas_equalTo(70);
    }];
}

@end
