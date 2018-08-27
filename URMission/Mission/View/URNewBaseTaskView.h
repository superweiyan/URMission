//
//  URNewBaseTaskView.h
//  URMission
//
//  Created by lin weiyan on 2018/8/27.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class URMissionHeadLineView;

typedef void (^TaskOptCallback)(BOOL);

@interface URNewBaseTaskView : UIView

@property (nonatomic, copy) TaskOptCallback             optCallback;
@property (nonatomic, strong) URMissionHeadLineView     *headLineView;

- (void)updateHeadline:(NSString *)headLine;

@end
