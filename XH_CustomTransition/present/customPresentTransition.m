
//
//  customPresentTransition.m
//  XH_CustomTransition
//
//  Created by 信昊 on 2018/9/14.
//  Copyright © 2018年 信昊. All rights reserved.
//

#import "customPresentTransition.h"
#import "presentViewController.h"
#import "presentDViewController.h"

@implementation customPresentTransition
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //1.获取动画的源控制器和目标控制器
    presentViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    presentDViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *container = [transitionContext containerView];
    UIView *fromView = fromVC.view;
    //    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    
    toView.frame = CGRectMake(fromView.frame.origin.x, CGRectGetMaxY(fromView.frame)/9.0f, fromView.frame.size.width, fromView.frame.size.height);
    toView.alpha = 0;
    
    [container addSubview:toView];
    
    NSTimeInterval transitionDuration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:transitionDuration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        toView.alpha = 1;
        toView.frame = [transitionContext finalFrameForViewController:toVC];
    } completion:^(BOOL finished) {
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        [transitionContext completeTransition:!wasCancelled];
    }];
    
}

@end
