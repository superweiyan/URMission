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

- (void)saveMission:(URNewMission *)mission
{
    [[URDatabaseService shareInstance] addMission:mission callback:^(NSInteger result) {
        
    }];
}

@end
