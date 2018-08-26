//
//  URNewTaskNameView.h
//  URMission
//
//  Created by lin weiyan on 2018/8/25.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^onNextClicked)(void);

@interface URNewTaskNameView : UIView

@property (nonatomic, copy)  onNextClicked  callback;

@end
