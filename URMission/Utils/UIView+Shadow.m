//
//  UIView+Shadow.m
//  URMission
//
//  Created by lin weiyan on 2018/10/23.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "UIView+Shadow.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (Shadow)

- (void)addShadow:(CGFloat)radius
{
    self.layer.shadowOpacity = 0.7;
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowRadius = radius;
    self.layer.shadowOffset = CGSizeMake(0, 0);
}

@end
