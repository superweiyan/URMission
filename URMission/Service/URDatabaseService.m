//
//  URDatabaseService.m
//  URMission
//
//  Created by lin weiyan on 2018/10/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URDatabaseService.h"
#import "FMDatabase.h"
#import "URPathConfig.h"

@interface URDatabaseService()

@property (nonatomic, strong) FMDatabase *db;

@end

@implementation URDatabaseService

static id obj = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[URDatabaseService alloc] init];
    });
    return obj;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (BOOL)initDatabase:(uint64_t)db
{
    NSString *path = [URPathConfig getDirectory];
    self.db = [FMDatabase databaseWithPath:path];
    if ([self.db open]) {
        return YES;
    }
    return NO;
}

@end
