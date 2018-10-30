//
//  URMissionModule.h
//  URMission
//
//  Created by lin weiyan on 2018/10/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URMissionModel.h"

NS_ASSUME_NONNULL_BEGIN

@class URMissionInfo;

@interface URMissionModule : NSObject

+ (instancetype)shareInstance;

- (void)saveMission:(URMissionInfo *)mission;

- (void)loadMission:(NSDate *)date callback:(MissionLoadCallback)callback;

@end

NS_ASSUME_NONNULL_END
