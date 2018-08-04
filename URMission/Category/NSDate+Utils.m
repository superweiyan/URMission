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

+ (NSString *)formatTimeWithMinuteAndSecond:(int64_t)time dayCountFromNow:(NSUInteger *)count {
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
@end
