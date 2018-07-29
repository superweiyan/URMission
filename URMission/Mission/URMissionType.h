//
//  URMissionType.h
//  URMission
//
//  Created by lin weiyan on 2018/7/29.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, URPriorityType) {
    URPriorityTypeNormal = 0,   //普通
    URPriorityTypeImport = 1,   //重要
    URPriorityTypeUrgent = 2,   //紧急
};

@interface URMissionModel : NSObject

@property (nonatomic, strong) NSString          *missionName;           //目标
@property (nonatomic, strong) NSString          *missionDesc;           //描述
@property (nonatomic, strong) NSDate            *startDate;             //开始时间
@property (nonatomic, strong) NSDate            *endDate;               //结束时间
@property (nonatomic, assign) NSUInteger        expectCount;            //期望的次数
@property (nonatomic, strong) NSString          *classify;              //分类
@property (nonatomic, assign) URPriorityType    prioriy;                //优先级
@property (nonatomic, strong) NSString          *colclusion;            //结论

@end
