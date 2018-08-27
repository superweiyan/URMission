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

@interface URNewTastTimeView()


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
        
        self.calendarView = [[URCalendarView alloc] init];
        [self addSubview:self.calendarView];
        [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
            
        }];
    }
    return self;
}

@end
