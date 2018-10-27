//
//  URMissionModel.h
//  URMission
//
//  Created by lin weiyan on 2018/10/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface URNewMission : NSObject

@property (nonatomic, assign) UInt64    mId;

@property (nonatomic, strong) NSString  *title;
@property (nonatomic, strong) NSString  *desc;
@property (nonatomic, strong) NSDate    *startData;
@property (nonatomic, strong) NSDate    *endData;
@property (nonatomic, strong) NSDate    *notifyData;
@property (nonatomic, strong) NSDate    *createData;

@property (nonatomic, strong) NSDictionary<NSNumber *, NSString *> *tagDict;


@end

NS_ASSUME_NONNULL_END
