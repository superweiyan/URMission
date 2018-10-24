//
//  URDataSelectView.h
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^DataSelectViewClicked)(void);

@interface URDataSelectView : UIView

@property (nonatomic, strong) NSString *tip;

@property (nonatomic, copy) DataSelectViewClicked  callback;

- (void)updateTime:(NSDate *)date;

@end

NS_ASSUME_NONNULL_END
