//
//  NewMissionToolBar.h
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^MissionToolOKBlock)(void);

@interface NewMissionToolBar : UIView

@property (nonatomic, copy) MissionToolOKBlock  okBlock;

@end

NS_ASSUME_NONNULL_END
