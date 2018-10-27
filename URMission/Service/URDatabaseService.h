//
//  URDatabaseService.h
//  URMission
//
//  Created by lin weiyan on 2018/10/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URDatabaseTypes.h"

NS_ASSUME_NONNULL_BEGIN

@class URNewMission;

@interface URDatabaseService : NSObject

+ (instancetype)shareInstance;

- (BOOL)initDatabase:(uint64_t)db;

- (void)addMission:(URNewMission *)mission callback:(DBCallback)callback;

@end

NS_ASSUME_NONNULL_END
