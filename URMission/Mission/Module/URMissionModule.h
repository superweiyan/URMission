//
//  URMissionModule.h
//  URMission
//
//  Created by lin weiyan on 2018/7/31.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URMissionType.h"

@interface URMissionModule : NSObject

+ (instancetype)sharedObject;

- (void)addMission:(URMissionModel *)model;

- (NSArray *)getMission;

@end
