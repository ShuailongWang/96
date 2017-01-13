//
//  SQSelectAddressTransitioning.m
//  PinMoney
//
//  Created by Money on 2016/12/26.
//  Copyright © 2016年 Money. All rights reserved.
//

#import "SQSelectAddressTransitioning.h"

@interface SQSelectAddressPresentationController : UIPresentationController

@end

@implementation SQSelectAddressPresentationController

- (void)presentationTransitionWillBegin
{
    [self.containerView addSubview:self.presentedView];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    [self.presentedView removeFromSuperview];
}

@end

@interface SQSelectAddressAnimatedTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter=isDismissed) BOOL dismissed;

@end

static const NSTimeInterval _animationDuration = 0.25;

@implementation SQSelectAddressAnimatedTransitioning

#pragma mark - UIViewControllerAnimatedTransitioning
// 设置动画时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return _animationDuration;
}

// 设置动画展示效果
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    if (!self.isDismissed)
    {
        UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
        toView.frame = CGRectMake(0, 0, containerView.bounds.size.width, containerView.bounds.size.height);
        toView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        toView.alpha = 0;
        [UIView animateWithDuration:_animationDuration animations:^{
            toView.alpha = 1.0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
    else
    {
        UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
        [UIView animateWithDuration:_animationDuration animations:^{
            
            fromView.alpha = 0.0;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    }
}

@end


@implementation SQSelectAddressTransitioning

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return [[SQSelectAddressPresentationController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    SQSelectAddressAnimatedTransitioning *anima = [[SQSelectAddressAnimatedTransitioning alloc] init];
    anima.dismissed = NO;
    return anima;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    SQSelectAddressAnimatedTransitioning *anima = [[SQSelectAddressAnimatedTransitioning alloc] init];
    anima.dismissed = YES;
    return anima;
}

@end
