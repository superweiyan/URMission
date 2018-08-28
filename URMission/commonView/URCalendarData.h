//
//  URCalendarData.h
//  URMission
//
//  Created by lin weiyan on 2018/8/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface URCalendarItem : NSObject

@property (nonatomic, assign) NSUInteger    yMonth;
@property (nonatomic, assign) NSUInteger    startWeek;  //1号是星期几
@property (nonatomic, assign) NSUInteger    monthDay;   //这个月有几天
@property (nonatomic, assign) NSUInteger    weekLine;  //这个月有几行

@end
