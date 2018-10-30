//
//  URDatabaseService.h
//  URMission
//
//  Created by lin weiyan on 2018/10/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URDatabaseTypes.h"
#import "URMissionModel.h"

NS_ASSUME_NONNULL_BEGIN

@class URMissionInfo;

@interface URDatabaseService : NSObject

+ (instancetype)shareInstance;

- (BOOL)initDatabase:(uint64_t)db;

- (void)addMission:(URMissionInfo *)mission callback:(DBCallback)callback;

- (void)loadMissionRange:(NSTimeInterval)tm
              lastSecond:(NSTimeInterval)lm
                callback:(MissionLoadCallback)callback;

@end

NS_ASSUME_NONNULL_END
