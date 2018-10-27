//
//  URMissionModule.h
//  URMission
//
//  Created by lin weiyan on 2018/10/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class URNewMission;

@interface URMissionModule : NSObject

+ (instancetype)shareInstance;

- (void)saveMission:(URNewMission *)mission;

@end

NS_ASSUME_NONNULL_END
