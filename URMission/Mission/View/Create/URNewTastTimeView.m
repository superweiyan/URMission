//
//  URNewTastTimeView.m
//  URMission
//
//  Created by lin weiyan on 2018/8/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URNewTastTimeView.h"
#import "URCalendarView.h"
#import "Masonry.h"
#import "URMissionHeadLineView.h"
#import "URWeekTitleView.h"
#import "URCommonMarco.h"

@interface URNewTastTimeView()

@property (nonatomic, strong) URWeekTitleView   *titleView;
@property (nonatomic, strong) URCalendarView    *calendarView;

@end


@implementation URNewTastTimeView

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
        
        [self updateHeadline:@"选择任务时间段"];
        
        self.titleView = [[URWeekTitleView alloc] init];
        [self addSubview:self.titleView];
        [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.mas_equalTo(self);
            make.leading.mas_equalTo(self);
            make.height.mas_equalTo(25);
            make.top.mas_equalTo(self.headLineView.mas_bottom);
        }];
        
        WeakSelf()
        self.calendarView = [[URCalendarView alloc] init];
        self.calendarView.itemClickedBlock = ^(NSDate *date) {
            [weakSelf handleData:date];
        };
        [self addSubview:self.calendarView];
        [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(self).mas_offset(5);
            make.trailing.mas_equalTo(self).mas_offset(-5);
            make.top.mas_equalTo(self.titleView.mas_bottom).mas_offset(5);
            make.bottom.mas_equalTo(self).mas_offset(-5);
        }];
    }
    return self;
}

- (void)handleData:(NSDate *)date
{
    if (self.taskTimeCallback) {
        self.taskTimeCallback(date);
    }
}


@end
