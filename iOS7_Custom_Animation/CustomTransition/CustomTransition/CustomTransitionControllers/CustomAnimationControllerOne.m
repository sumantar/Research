//
//  CustomAnimationControllerOne.m
//  CustomTransition
//
//  Created by sumantar on 10/02/14.
//  Copyright (c) 2014 sumantar. All rights reserved.
//

#import "CustomAnimationControllerOne.h"

@implementation CustomAnimationControllerOne
- (id)init
{
    self = [super init];
    if (self) {
        self.presentationDuration = 2.0;
        self.dismissalDuration = 1.0;
    }
    return self;
}

//Write our custom transition here
- (void) executePresenationAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView* inView = [transitionContext containerView];
    
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [inView addSubview:toViewController.view];
    
    CGPoint centerOffScreen = inView.center;
    
    centerOffScreen.y = (-1)*inView.frame.size.height;
    toViewController.view.center = centerOffScreen;
    
    [UIView animateWithDuration:self.presentationDuration delay:0.0f usingSpringWithDamping:0.4f initialSpringVelocity:6.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        toViewController.view.center = inView.center;
        fromViewController.view.alpha = 0.6;
        
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:YES];
    }];
}

- (void) executeDismissalAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView* inView = [transitionContext containerView];
    
    UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    [inView insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    CGPoint centerOffScreen = inView.center;
    centerOffScreen.y = (-1)*inView.frame.size.height;
    
    [UIView animateKeyframesWithDuration:self.dismissalDuration delay:0.0f options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            
            CGPoint center = fromViewController.view.center;
            center.y += 50;
            fromViewController.view.center = center;
        }];
        
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.5 animations:^{
            
            fromViewController.view.center = centerOffScreen;
            toViewController.view.alpha = 1.0;
            
        }];
        
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

#pragma mark UIViewControllerAnimatedTransitioning Delegate Methods

//Mandatory methods for UIViewControllerAnimatedTransitioning
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.isPresenting? self.presentationDuration:self.dismissalDuration;
}


-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if(self.isPresenting)
    {
        [self executePresenationAnimation:transitionContext];
    }
    else
    {
        [self executeDismissalAnimation:transitionContext];
    }
}
@end
