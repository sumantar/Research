//
//  ViewController.m
//  CustomTransition
//
//  Created by sumantar on 08/02/14.
//  Copyright (c) 2014 sumantar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)showNextView:(id)sender;

- (IBAction)onInteractiveTransition:(id)sender;

@property(nonatomic, strong) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) UINavigationController *nav;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageView.image = [UIImage imageNamed:@"Image"];
    
    //Lets set Motion Effect
    UIInterpolatingMotionEffect *xAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    xAxis.minimumRelativeValue = @(-150);
    xAxis.maximumRelativeValue = @(150);
    
    UIInterpolatingMotionEffect *yAxis = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    yAxis.minimumRelativeValue = @(-150);
    yAxis.maximumRelativeValue = @(150);
    
    //Lets group the effect
    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[xAxis, yAxis];
    
    [self.imageView addMotionEffect:group];
    [self.view addMotionEffect:group];
    
    UIInterpolatingMotionEffect *shadowEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"layer.shadowOffset" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    shadowEffect.minimumRelativeValue = [NSValue valueWithCGSize:CGSizeMake(-10, 5)];
    
    shadowEffect.maximumRelativeValue = [NSValue valueWithCGSize:CGSizeMake(10, 5)];
    
    [self.imageView addMotionEffect:shadowEffect];
    
//    //////////////////////////////////////////
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeNav) name:@"Back12345" object:nil];
    
}

- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void) removeNav
{
    //[self.navController.view removeFromSuperview];
    NSLog(@"Remove Nav");
    //[self.nav.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)showNextView:(id)sender {
}

- (IBAction)onInteractiveTransition:(id)sender {
    
}

- (IBAction)unwindYellow:(UIStoryboardSegue *)unwindSegue{
    
}
@end
