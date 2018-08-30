//
//  URCalenderMonthTableViewCell.h
//  URMission
//
//  Created by lin weiyan on 2018/8/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class URCalendarItem;

typedef void (^onCalenderItemClickCallback)(NSDate *);

@interface URCalenderMonthTableViewCell : UITableViewCell

@property (nonatomic, strong) URCalendarItem            *item;
@property (nonatomic, copy) onCalenderItemClickCallback itemClickBlock;

- (void)updateSelectRange:(NSDate *)start end:(NSDate *)end;

@end
