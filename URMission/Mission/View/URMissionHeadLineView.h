//
//  URMissionHeadLineView.h
//  URMission
//
//  Created by lin weiyan on 2018/8/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^onNextClicked)(void);
typedef void (^onCancelClicked)(void);

@interface URMissionHeadLineView : UIView

@property (nonatomic, copy)  onCancelClicked    cancelCallback;
@property (nonatomic, copy)  onNextClicked      callback;

@property (nonatomic, strong) NSString          *headline;

@end
