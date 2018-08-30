//
//  URCalendarView.m
//  URMission
//
//  Created by lin weiyan on 2018/8/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URCalendarView.h"
#import "URCalendarData.h"
#import "URCalenderMonthTableViewCell.h"
#import "NSDate+Utils.h"

@interface URCalendarView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView   *calenderTableView;

@property (nonatomic, strong) NSMutableArray    *monthArray;

@end

@implementation URCalendarView

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
        [self loadView];
        [self loadData];
    }
    return self;
}

- (void)dealloc
{
    self.calenderTableView.delegate = nil;
    self.calenderTableView.dataSource = nil;
}

- (void)loadView
{
    self.calenderTableView = [[UITableView alloc] init];
    [self addSubview:self.calenderTableView];
    self.calenderTableView.delegate = self;
    self.calenderTableView.dataSource = self;
    [self.calenderTableView registerClass:[URCalenderMonthTableViewCell class]
                   forCellReuseIdentifier:@"URCalenderMonthTableViewCell"];
    
    self.calenderTableView.tableFooterView = [UIView new];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.calenderTableView.frame = self.bounds;
}

- (void)loadData
{
    self.monthArray = [[NSMutableArray alloc] init];
    NSUInteger month = [self getDateToInt:[NSDate date]];
    for(int i = 0; i < 3; i++) {
        [self.monthArray addObject:[self calcCalenderItem:month]];
        month = [self getNextMonth:month];
    }
    [self.calenderTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.monthArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.monthArray.count) {
        URCalendarItem *item = [self.monthArray objectAtIndex:indexPath.row];
        CGFloat h = [URCalendarView getCellHeight:item];
        return h;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    URCalenderMonthTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"URCalenderMonthTableViewCell"];

    if (indexPath.row < self.monthArray.count) {
        URCalendarItem *item = [self.monthArray objectAtIndex:indexPath.row];
        cell.item = item;
        
    }
    return cell;
}

#pragma mark - helper

- (NSUInteger)getDateToInt:(NSDate *)date
{
    NSUInteger month = [date getMonth];
    NSUInteger year = [date getYear];
    return year * 100 + month;
}

- (NSUInteger)getNextMonth:(NSUInteger)current
{
    int month = current % 100;
    
    if (month == 12) {
        current += 89;
    }
    else {
        current += 1;
    }
    return current;
}

- (NSUInteger)getLastMonth:(NSUInteger)current
{
    int month = current % 100;
    if (month == 1) {
        current -= 89;
    }
    else {
        current -= 1;
    }
    return current;
}

- (URCalendarItem *)calcCalenderItem:(NSUInteger)month
{
    NSString *monthString = [URCalendarView converMonthToString:month];
    NSDate *itemDate = [NSDate getCalendarFromString:monthString format:@"yyyy-MM"];
    
    URCalendarItem *item = [[URCalendarItem alloc] init];
    item.yMonth = month;
    item.startWeek = [NSDate getFirstDayWeekForMonth:itemDate];
    item.monthDay = [itemDate getMonthDays];
    item.weekLine = [itemDate getWeeksInMonth];
    
    return item;
}

// yyyy-MM
+ (CGFloat)getCellHeight:(URCalendarItem *)item
{
    // 顶部空隙 + 月份 + 星期行数 + 底部空隙
    return  5 + 45 + item.weekLine * 45 + 5;
}

+ (NSString *)converMonthToString:(NSUInteger)month
{
    NSUInteger m = month % 100;
    NSUInteger y = month / 100;
    if (m < 10) {
        return [NSString stringWithFormat:@"%ld-0%ld", y, m];
    }
    return [NSString stringWithFormat:@"%ld-%ld", y, m];
}

@end
