//
//  URMissionModule.m
//  URMission
//
//  Created by lin weiyan on 2018/10/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMissionModule.h"
#import "URMissionModel.h"
#import "URDatabaseService.h"

@interface URMissionModule()

@end

@implementation URMissionModule

static id missionModule = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        missionModule = [[URMissionModule alloc] init];
    });
    return missionModule;
}



- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)initDatabase
{
    
}

- (void)saveMission:(URMissionInfo *)mission
{
    [[URDatabaseService shareInstance] addMission:mission callback:^(NSInteger result) {
        if (result) {
            
        }
    }];
}

- (void)loadMission:(NSDate *)date callback:(MissionLoadCallback)callback
{
    NSTimeInterval tm = [URMissionModule zeroOfDate:date];
    NSTimeInterval lm = [URMissionModule lastSecondOfDate:date];
    
    [[URDatabaseService shareInstance] loadMissionRange:tm
                                             lastSecond:lm
                                               callback:^(int32_t result, NSArray<URMissionInfo *> *missionInfo){
        
                                              if (!result) {
                                                  if(callback) {
                                                      callback(result, missionInfo);
                                                  }
                                              }
        
    }];
}

+ (NSTimeInterval)zeroOfDate:(NSDate *)originDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSUIntegerMax fromDate:originDate];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    
    // components.nanosecond = 0 not available in iOS
    return (double)(int)[[calendar dateFromComponents:components] timeIntervalSince1970];
//    NSDate * date = [NSDate dateWithTimeIntervalSince1970:ts];
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate: date];
//    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
//    return localeDate;
}

+ (NSTimeInterval)lastSecondOfDate:(NSDate *)originDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSUIntegerMax fromDate:originDate];
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    
    // components.nanosecond = 0 not available in iOS
    return (double)(int)[[calendar dateFromComponents:components] timeIntervalSince1970];
}


@end
