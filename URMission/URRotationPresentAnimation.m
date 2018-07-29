//
//  URRotationPresentAnimation.m
//  URMission
//
//  Created by lin weiyan on 2018/7/28.
//  Copyright © 2018 lin weiyan. All rights reserved.
//

#import "URRotationPresentAnimation.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface URRotationPresentAnimation()

@property (nonatomic, assign) AnimationType animationType;

@end

@implementation URRotationPresentAnimation

+ (instancetype)animationWithAnimationType:(AnimationType)animationType{
    
    return [[self alloc] initWithAnimationType:animationType];
}

- (instancetype)initWithAnimationType:(AnimationType)animationType{
    
    self = [super init];
    if (self) {
        _animationType = animationType;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 1;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (_animationType) {
        case AnimationTypeModalPresent:
            [self presentAnimationTransition:transitionContext];
            break;
        case AnimationTypeModalDismiss:
            [self dismissAnimationTransition:transitionContext];
            break;
        case AnimationTypeNavPush:
            [self pushAnimationTransition:transitionContext];
            break;
        case AnimationTypeNavPop:
            [self popAnimationTransition:transitionContext];
            break;
        default:
            break;
    }
}

- (void)presentAnimationTransition:(id)transitionContext{
    
    //    在此实现动画具体内容
    
    /**
     *  使用 transitionContext（转场上下文）获取相关界面
     *  viewForKey:方法 可以直接获取View但需要iOS8以上
     *  UIView *toView   = [transitionContext viewForKey:UITransitionContextToViewKey];
     *  UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
     *  为兼容iOS7，使用viewControllerForKey:方法 先获取控制器再获取对应控制器的view
     */
    UIView *containerView = [transitionContext containerView];
//    UIView *fromView      = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView        = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    //将新的界面加到容器上
    [containerView addSubview:toView];
    
    //设置形变初始值
    toView.frame = [UIScreen mainScreen].bounds;
    toView.transform = CGAffineTransformMakeScale(0.025, 0.0125);
    toView.center = (CGPoint){ScreenWidth-30, 45};
    
    //设置动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        toView.center = (CGPoint){ScreenWidth/2.0f, ScreenHeight/2.0f};
        toView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:^(BOOL finished) {
        
        //完成的时候一定要调用让过程动画完成，否则过场动画无法完成（新界面出来了但，用户无法继续操作）
        BOOL success = ![transitionContext transitionWasCancelled];
        [transitionContext completeTransition:success];
    }];
}

- (void)dismissAnimationTransition:(id)transitionContext{
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView      = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView        = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    // 先把原来的视图添加回去
    [containerView insertSubview:toView atIndex:0];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromView.center = (CGPoint){ScreenWidth-30,45};
        fromView.transform = CGAffineTransformMakeScale(0.025, 0.0125);
        
    } completion:^(BOOL finished) {
        
        BOOL success = ![transitionContext transitionWasCancelled];
        
        // 注意要把视图移除
        [fromView removeFromSuperview];
        
        [transitionContext completeTransition:success];
    }];
}

- (void)pushAnimationTransition:(id)transitionContext{
    
    UIView *containerView = [transitionContext containerView];
    UIView *toView        = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    [containerView addSubview:toView];
    
    toView.frame = [UIScreen mainScreen].bounds;
    toView.transform = CGAffineTransformMakeScale(1, CGFLOAT_MIN);
    toView.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        toView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        toView.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        BOOL success = ![transitionContext transitionWasCancelled];
        [transitionContext completeTransition:success];
    }];
}

- (void)popAnimationTransition:(id)transitionContext{
    
    UIView *containerView = [transitionContext containerView];
    UIView *fromView      = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view;
    UIView *toView        = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    [containerView insertSubview:toView atIndex:0];
    [UIView animateWithDuration:[self transitionDuration:transitionContext]*2/3 animations:^{
        
        fromView.transform = CGAffineTransformMakeScale(0.09, 0.16);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext]/3 animations:^{
            fromView.center = (CGPoint){fromView.center.x, ScreenHeight+fromView.frame.size.height/2.0f};
        } completion:^(BOOL finished) {
            
            BOOL success = ![transitionContext transitionWasCancelled];
            
            [fromView removeFromSuperview];
            [transitionContext completeTransition:success];
        }];
    }];
}

//- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
//                                                                            presentingController:(UIViewController *)presenting
//                                                                                sourceController:(UIViewController *)source
//{
//    return self;
////    return presenting;
//}
//
//- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
//{
//    return self;
//}

@end
