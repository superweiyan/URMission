//
//  URDataPickerView.h
//  URMission
//
//  Created by lin weiyan on 2018/7/29.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OkClicked)(NSDate *);
typedef void (^CancelClicked)(void);

@interface URDataPickerView : UIView

@property (nonatomic, copy) OkClicked  okClickedCallback;
@property (nonatomic, copy) CancelClicked   cancelClicked;

@end
