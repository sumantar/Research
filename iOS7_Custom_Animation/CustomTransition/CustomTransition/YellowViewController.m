//
//  CustomTransitionViewController.m
//  CustomTransition
//
//  Created by sumantar on 09/02/14.
//  Copyright (c) 2014 sumantar. All rights reserved.
//

#import "YellowViewController.h"
#import "CustomAnimatedTransitioningController.h"
#import "CustomAnimationControllerOne.h"
#import "CustomAnimationControllerTwo.h"

@interface YellowViewController ()

@property (strong, nonatomic) IBOutlet UIButton *animation1Button;
@property (strong, nonatomic) IBOutlet UIButton *animation2Button;

- (IBAction)showBlueView:(id)sender;

@property (nonatomic, strong) id<CustomAnimatedTransitioningController> animationController;

@end

@implementation YellowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.transitioningDelegate = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showBlueView:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *newController = [storyboard instantiateViewControllerWithIdentifier:@"BlueViewController"];
    
    if(sender == self.animation1Button)
        self.animationController = [[CustomAnimationControllerOne alloc] init];
    else
        self.animationController = [[CustomAnimationControllerTwo alloc] init];
    
    newController.transitioningDelegate = self;
    
    [self presentViewController:newController animated:YES completion:nil];
    
}


#pragma mark UIViewControllerTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    self.animationController.isPresenting = YES;
    
    return self.animationController;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.animationController.isPresenting = NO;
    
    return self.animationController;
}

@end
