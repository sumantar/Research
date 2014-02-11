//
//  BlueViewController.m
//  CustomTransition
//
//  Created by sumantar on 09/02/14.
//  Copyright (c) 2014 sumantar. All rights reserved.
//

#import "BlueViewController.h"

@interface BlueViewController ()

- (IBAction)dismiss:(id)sender;

@end

@implementation BlueViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
