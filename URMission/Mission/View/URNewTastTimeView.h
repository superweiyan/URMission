//
//  URNewTastTimeView.h
//  URMission
//
//  Created by lin weiyan on 2018/8/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "URNewBaseTaskView.h"

typedef void (^NewTaskTimeCallback) (NSDate *);

@interface URNewTastTimeView : URNewBaseTaskView

@property (nonatomic, copy) NewTaskTimeCallback  taskTimeCallback;

@end
