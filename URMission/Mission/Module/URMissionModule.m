//
//  URMissionModule.m
//  URMission
//
//  Created by lin weiyan on 2018/7/31.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URMissionModule.h"

@interface URMissionModule()

@property (nonatomic, strong) NSMutableArray    *missionArray;
@end

@implementation URMissionModule

+ (instancetype)sharedObject
{
    static URMissionModule *missionModule = nil;
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
        self.missionArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)addMission:(URMissionModel *)model
{
    [self.missionArray addObject:model];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kURMissionAddNotification object:nil];
}

- (NSArray *)getMission
{
    return self.missionArray;
}

@end
