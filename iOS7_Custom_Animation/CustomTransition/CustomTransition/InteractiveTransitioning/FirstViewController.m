//
//  FirstViewController.m
//  CustomTransition
//
//  Created by sumantar on 10/02/14.
//  Copyright (c) 2014 sumantar. All rights reserved.
//

#import "FirstViewController.h"
#import "NavigationControllerDelegate.h"

@interface FirstViewController ()
@property (nonatomic, strong) IBOutlet NavigationControllerDelegate *navDelegate;
@end

@implementation FirstViewController

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
    self.navDelegate.navigationController = self.navigationController;
    self.navigationController.delegate = self.navDelegate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
