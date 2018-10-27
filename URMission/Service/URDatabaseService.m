//
//  URDatabaseService.m
//  URMission
//
//  Created by lin weiyan on 2018/10/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URDatabaseService.h"
#import "FMDatabaseQueue.h"
#import "URPathConfig.h"
#import "URMissionModel.h"

@interface URDatabaseService()

@property (nonatomic, strong) FMDatabaseQueue *dbQueue;

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

- (BOOL)initDatabase:(uint64_t)uid
{
    NSString *path = [NSString stringWithFormat:@"%@/%lld.db", [URPathConfig getDirectory], uid];
    
    self.dbQueue = [[FMDatabaseQueue alloc] initWithPath:path];
    [self createTable];
    return NO;
}

- (void)createTable
{
    NSString *sql = @"CREATE TABLE MissionTable (id INTEGER,\
                   subType INTEGER,\
                   title TEXT NOT NULL,\
                   desc TEXT,\
                   createDate INTEGER NOT NULL,\
                   startDate INTEGER NOT NULL,\
                   endDate INTEGER NOT NULL,\
                   notifyDate INTEGER NOT NULL, \
                   tag TEXT,\
                   createData INTEGER NOT NULL,\
                   version INTEGER DEFAULT(1),\
                   PRIMARY KEY(id, subType));";
    
    [self doCreateTableWithSQL:sql];
}

- (void)doCreateTableWithSQL:(NSString *)sql
{
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:sql];
        if ([db hadError]) {
            NSLog(@"Create Tables error:%@", [db lastErrorMessage]);
        }
    }];
}


- (void)addMission:(URNewMission *)mission callback:(DBCallback)callback
{
    NSString *tag = nil;
    if (mission.tagDict) {
        tag = [self jsonString:mission.tagDict];
    }
    
    NSString *sql = [NSString stringWithFormat:@"insert or replace into MissionTable (id, title,\
                     desc, startDate, endDate, notifyDate, tag, createData) values(?,?,?,?,?,?,?,?)"];
    
    [self.dbQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:sql withArgumentsInArray:@[@(mission.mId),
                                                      mission.title,
                                                      mission.desc,
                                                      @(mission.startData.timeIntervalSince1970),
                                                      @(mission.endData.timeIntervalSince1970),
                                                      @(mission.notifyData.timeIntervalSince1970),
                                                      tag,
                                                      @(mission.createData.timeIntervalSince1970)]];
    
        if ([db hadError]) {
            *rollback = YES;
            if (callback) {
                callback(1);
            };
        } else {
            if (callback) {
                callback(0);
            }
        }
    }];
}

- (NSString *)jsonString:(NSDictionary *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&error];
    if (!jsonData) {
        return nil;
    }
    
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonStr;
}


@end
