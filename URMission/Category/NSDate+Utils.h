//
//  NSDate+Utils.h
//  URMission
//
//  Created by lin weiyan on 2018/7/31.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

- (NSUInteger)getMonth;

- (NSUInteger)getDay;

- (NSUInteger)getYear;

- (NSUInteger)getMonthDays;

- (NSUInteger)getWeeksInMonth;

+ (BOOL)isToday:(NSDate *)otherDate;

+ (NSDate *)getToday;

+ (BOOL)isThisYear:(NSDate *)date;

+ (BOOL)isThisWeek:(NSDate *)date;

+ (NSString *)weekStrFromDate:(NSDate *)date;

+ (BOOL)isYesToday:(NSDate *)date;

/**
 * 将时间戳格式化为形如 09:00 或 明天09:00 或 02/28 09:00
 */
+ (NSString *)formatTimeWithMinuteAndSecond:(int64_t)time;

/**
 * 类似formatTimeWithMinuteAndSecond:, 并且以参数count返回time对应的时间跟现在的时间相差的天数
 */
+ (NSString *)formatTimeWithMinuteAndSecond:(int64_t)time dayCountFromNow:(NSUInteger *)count;

+ (NSString *)converData:(NSDate *)date;

+ (NSInteger)getFirstDayWeekForMonth:(NSDate*)date;

//时间格式为 yyyy-MM-dd
+ (NSDate *)getCalendarFromString:(NSString *)string format:(NSString *)format;

+ (NSString *)theDateConversionStr:(NSDate *)date format:(NSString *)format;


@end
