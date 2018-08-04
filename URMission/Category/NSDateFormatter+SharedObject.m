//
//  NSDateFormatter+SharedObject.m
//  URMission
//
//  Created by lin weiyan on 2018/7/31.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "NSDateFormatter+SharedObject.h"

@implementation NSDateFormatter (SharedObject)

+ (instancetype)sharedObject
{
    static NSDateFormatter *shareFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareFormatter = [[NSDateFormatter alloc] init];
    });
    
    return shareFormatter;
}

@end
