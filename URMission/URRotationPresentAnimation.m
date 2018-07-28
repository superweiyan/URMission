//
//  URRotationPresentAnimation.m
//  URMission
//
//  Created by lin weiyan on 2018/7/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URRotationPresentAnimation.h"

@interface URRotationPresentAnimation()

@end

@implementation URRotationPresentAnimation

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 2;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect finalRect = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalRect, 0, [[UIScreen mainScreen]bounds].size.height);

    [[transitionContext containerView]addSubview:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0
         usingSpringWithDamping:0.6 initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
        toVC.view.frame = finalRect;
    } completion:^(BOOL finished) {
        //5
        [transitionContext completeTransition:YES];
    }];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                            presentingController:(UIViewController *)presenting
                                                                                sourceController:(UIViewController *)source
{
    return self;
//    return presenting;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self;
}

@end
