//
//  NavigationControllerDelegate.m
//  CustomNavigationTransition
//
//  Created by sumantar on 10/02/14.
//  Copyright (c) 2014 sumantar. All rights reserved.
//

#import "NavigationControllerDelegate.h"
#import "CustomAnimatedTransitioning.h"

@interface NavigationControllerDelegate()

@property (weak, nonatomic) IBOutlet UINavigationController *navController;
@property (strong, nonatomic) CustomAnimatedTransitioning* animator;
@property (strong, nonatomic) UIPercentDrivenInteractiveTransition* interactionController;

@end

@implementation NavigationControllerDelegate

- (void)awakeFromNib
{
    UIPanGestureRecognizer* panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.navController.view addGestureRecognizer:panRecognizer];
    
    self.animator = [CustomAnimatedTransitioning new];
}

- (void)pan:(UIPanGestureRecognizer*)recognizer
{
    UIView* view = self.navController.view;
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [recognizer locationInView:view];
        if (location.x <  CGRectGetMidX(view.bounds) && self.navController.viewControllers.count > 1) { // left half
            self.interactionController = [UIPercentDrivenInteractiveTransition new];
            [self.navController popViewControllerAnimated:YES];
        }
    } else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [recognizer translationInView:view];
        CGFloat d = fabs(translation.x / CGRectGetWidth(view.bounds));
        [self.interactionController updateInteractiveTransition:d];
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        if ([recognizer velocityInView:view].x > 0) {
            [self.interactionController finishInteractiveTransition];
        } else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPop) {
        return self.animator;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    return self.interactionController;
}


@end
