//
//  URNewTaskNameView.h
//  URMission
//
//  Created by lin weiyan on 2018/8/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URNewBaseTaskView.h"

@class URMissionModel;

typedef void (^NewTaskNameCallback)(NSString *);
@interface URNewTaskNameView : URNewBaseTaskView

@property (nonatomic, strong) NewTaskNameCallback  taskNameBlock;

@end
