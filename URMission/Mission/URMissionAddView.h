//
//  URMissionAddView.h
//  URMission
//
//  Created by lin weiyan on 2018/7/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URMissionType.h"

typedef void (^MissionAddClicked)(URMissionModel *);
typedef void (^MissionAddDismiss) (void);

@interface URMissionAddView : UIView

@property (nonatomic, copy) MissionAddClicked   addMissionCallback;
@property (nonatomic, copy) MissionAddDismiss   addDismissCallback;

@end
