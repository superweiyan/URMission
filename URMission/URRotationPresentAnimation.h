//
//  URRotationPresentAnimation.h
//  URMission
//
//  Created by lin weiyan on 2018/7/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, AnimationType) {
    
    AnimationTypeModalPresent = 0,  //Modal弹出动画
    AnimationTypeModalDismiss,      //Modal消失动画
    AnimationTypeNavPush,           //Nav Push动画
    AnimationTypeNavPop             //Nav Pop动画
};

@interface URRotationPresentAnimation : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)animationWithAnimationType:(AnimationType)animationType;

@end
