//
//  NSDate+Utils.m
//  URMission
//
//  Created by lin weiyan on 2018/7/31.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "NSDate+Utils.h"
#import "NSDateFormatter+SharedObject.h"

@implementation NSDate (Utils)

- (NSUInteger)getYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday
                                          fromDate:self];
    NSInteger year = [comps year];
    return year;
}


- (NSUInteger)getMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:self];
    NSInteger month = [comps month];
    return month;
}

- (NSUInteger)getDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:self];
    return (int)dateComponent.day;
}

- (NSUInteger)getMonthDays
{
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth
                                             forDate:self].length;
}

- (NSUInteger)getWeeksInMonth
{
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitWeekOfMonth inUnit:NSCalendarUnitMonth
                                             forDate:self].length;
}

+ (BOOL)isToday:(NSDate *)otherDate
{
    return [[NSCalendar currentCalendar] isDateInToday:otherDate];
}

+ (NSDate *)getToday
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:(NSCalendarUnitEra|NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay) fromDate:[NSDate date]];
    NSDate *today = [cal dateFromComponents:components];
    return today;
}

+ (NSString *)formatTimeWithMinuteAndSecond:(int64_t)time {
    NSDate *nowDate = [NSDate date];
    NSDate *nextDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [NSDateFormatter sharedObject];
    [dateFormatter setDateFormat:@"dd"];
    NSInteger nowDay = [[dateFormatter stringFromDate:nowDate] integerValue];
    NSInteger nextDay = [[dateFormatter stringFromDate:nextDate] integerValue];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    if (nowDay == nextDay) {
        return [dateFormatter stringFromDate:nextDate];
    }
    else if (nextDay - nowDay == 1) {
        return [NSString stringWithFormat:@"明天 %@", [dateFormatter stringFromDate:nextDate]];
    }
    else {
        [dateFormatter setDateFormat:@"MM/dd HH:mm"];
        return [dateFormatter stringFromDate:nextDate];
    }
    
}

+ (NSString *)formatTimeWithMinuteAndSecond:(int64_t)time dayCountFromNow:(NSUInteger *)count
{
    NSDate *nowDate = [NSDate date];
    NSDate *nextDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [NSDateFormatter sharedObject];
    [dateFormatter setDateFormat:@"dd"];
    NSInteger nowDay = [[dateFormatter stringFromDate:nowDate] integerValue];
    NSInteger nextDay = [[dateFormatter stringFromDate:nextDate] integerValue];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    if (nowDay == nextDay) {
        *count = 0;
        return [dateFormatter stringFromDate:nextDate];
    }
    else if (nextDay - nowDay == 1) {
        *count = 1;
        return [NSString stringWithFormat:@"明天 %@", [dateFormatter stringFromDate:nextDate]];
    }
    else {
        *count = (nextDay - nowDay);
        [dateFormatter setDateFormat:@"MM/dd HH:mm"];
        return [dateFormatter stringFromDate:nextDate];
    }
}

+ (NSString *)converData:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [NSDateFormatter sharedObject];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    return [dateFormatter stringFromDate:date];
}

+ (BOOL)isThisYear:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear;
    // 1.获得当前时间的年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    // 2.获得self的年月日
    NSDateComponents *selfCmps = [calendar components:unit fromDate:date];
    return nowCmps.year == selfCmps.year;
}

+ (BOOL)isThisWeek:(NSDate *)date
{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDate *startOfTheWeek;
    NSDate *endOfWeek;
    NSTimeInterval interval;
    [cal rangeOfUnit:NSCalendarUnitWeekOfMonth startDate:&startOfTheWeek interval:&interval forDate:now];
    endOfWeek = [startOfTheWeek dateByAddingTimeInterval:interval-1];
    if (date.timeIntervalSince1970 >= startOfTheWeek.timeIntervalSince1970 &&
        date.timeIntervalSince1970 <= endOfWeek.timeIntervalSince1970) {
        return YES;
    }
    return NO;
}

+ (BOOL)isYesToday:(NSDate *)date
{
    return [[NSCalendar currentCalendar] isDateInYesterday:date];
}

+ (NSString *)weekStrFromDate:(NSDate *)date
{
    NSArray *weeks = @[@"", @"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Beijing"];
    [calendar setTimeZone:timeZone];
    NSCalendarUnit unit = NSCalendarUnitWeekday;
    NSDateComponents *cmps = [calendar components:unit fromDate:date];
    return [weeks objectAtIndex:cmps.weekday];
}

+ (NSInteger)getFirstDayWeekForMonth:(NSDate*)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday fromDate:date];
    NSInteger weekday = [comps weekday];
    weekday--;
    if (weekday == 7) {
        return 0;
    }
    else {
        return weekday;
    }
}


+ (NSDate *)getCalendarFromString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (format.length == 0) {
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    else {
        [formatter setDateFormat:format];
    }
    
    NSDate *date=[formatter dateFromString:string];
    return date;
}

+ (NSString * )theDateConversionStr:(NSDate * )date format:(NSString *)format
{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    //实例化一个NSDateFormatter对象
    if (format.length == 0) {
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    else {
        [formatter setDateFormat:format];
    }
    //设定时间格式,这里可以设置成自己需要的格式
    NSString *currentDateStr = [formatter stringFromDate:date];
    // 根据自己需求处理字符串 return
    return [currentDateStr substringToIndex:7];
}

@end
