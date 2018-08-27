//
//  URAddMissionViewController.h
//  URMission
//
//  Created by lin weiyan on 2018/7/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^onPopViewController)(void);

@interface URAddMissionViewController : UIViewController

@property (nonatomic, copy) onPopViewController  popCallback;

@end
