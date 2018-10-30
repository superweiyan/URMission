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
    NSString *sql = @"CREATE TABLE MissionTable (id INTEGER NOT NULL,\
                   title TEXT NOT NULL,\
                   desc TEXT,\
                   createDate INTEGER NOT NULL,\
                   startDate INTEGER NOT NULL,\
                   endDate INTEGER NOT NULL,\
                   notifyDate INTEGER, \
                   tag TEXT,\
                   version INTEGER DEFAULT '1' NOT NULL,\
                   PRIMARY KEY(id))";
    
    [self doCreateTableWithSQL:sql];
}

- (void)doCreateTableWithSQL:(NSString *)sql
{
    [_dbQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:sql];
        if ([db hadError]) {
            *rollback = YES;
            NSLog(@"Create Tables error:%@", [db lastErrorMessage]);
        }
    }];
}


- (void)addMission:(URMissionInfo *)mission callback:(DBCallback)callback
{
    NSString *tag = nil;
    if (mission.tagDict) {
        tag = [self jsonString:mission.tagDict];
    }
    
    NSString *sql = [NSString stringWithFormat:@"insert or replace into MissionTable (id, title,\
                     desc, startDate, endDate, notifyDate, createDate) values(?,?,?,?,?,?,?)"];
    
    [self.dbQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        [db executeUpdate:sql withArgumentsInArray:@[@(mission.mId),
                                                      mission.title,
                                                      mission.desc,
                                                      @(mission.startData.timeIntervalSince1970),
                                                      @(mission.endData.timeIntervalSince1970),
                                                      @(mission.notifyData.timeIntervalSince1970),
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

- (void)loadMissionRange:(NSTimeInterval)tm lastSecond:(NSTimeInterval)lm callback:(MissionLoadCallback)callback
{
    [self.dbQueue inTransaction:^(FMDatabase *db, BOOL *rollback) {
        
        NSString *sql = [NSString stringWithFormat:@"select * from MissionTable where startDate < %f and endDate > %f", lm, tm];

        if ([db hadError]) {
            if(callback) {
                callback(1, [[NSArray alloc] init]);
            }
            return ;
        }
        
        FMResultSet *set = [db executeQuery:sql];
        
        NSMutableArray *infoArray = [[NSMutableArray alloc] init];
        
        while ([set next]) {
            URMissionInfo *info = [[URMissionInfo alloc] init];
            info.mId = [set intForColumn:@"Id"];
            info.title = [set stringForColumn:@"title"];
            info.desc = [set stringForColumn:@"desc"];
            info.startData = [[NSDate alloc] initWithTimeIntervalSince1970:[set intForColumn:@"startDate"]];
            info.endData = [[NSDate alloc] initWithTimeIntervalSince1970:[set intForColumn:@"endDate"]];
            info.notifyData = [[NSDate alloc] initWithTimeIntervalSince1970:[set intForColumn:@"notifyDate"]];
            info.createData = [[NSDate alloc] initWithTimeIntervalSince1970:[set intForColumn:@"createDate"]];
            
            [infoArray addObject:info];
        }
        
        if (callback) {
            callback(0, infoArray);
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
