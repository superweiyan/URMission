//
//  URDatePickerView.h
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol URDatePickerViewDelegate <NSObject>

- (void)onDatePickerOkClicked:(NSDate *)date;
- (void)onDatePickerCancelClicked;

@optional
- (void)onDatePickerClicked:(NSDate *)date;


@end

@interface URDatePickerView : UIView

@property (nonatomic, weak) id<URDatePickerViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
