//
//  URMultiSelectView.h
//  URMission
//
//  Created by lin weiyan on 2018/9/3.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^onMultiSelectClickedCallback)(NSUInteger);

@interface URMultiSelectView : UIView

@property (nonatomic, copy) onMultiSelectClickedCallback  selectBlock;

- (instancetype)initWithTitleArray:(NSArray *)titleArray;

@end
