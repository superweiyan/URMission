//
//  URCalendarView.h
//  URMission
//
//  Created by lin weiyan on 2018/8/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ItemClickedCallback) (NSDate *);

@interface URCalendarView : UIView

@property (nonatomic, copy) ItemClickedCallback  itemClickedBlock;

+ (CGFloat)getHeightForDate:(NSDate *)day;

@end
