//
//  JKViewController.m
//  BullsEye
//
//  Created by Guest User on 9/4/14.
//  Copyright (c) 2014 Josh Kutsko. All rights reserved.
//

#import "JKViewController.h"

@interface JKViewController ()

@end

@implementation JKViewController
{
    int _currentValue;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert {
    
    NSString *message =
    [NSString stringWithFormat: @"The value of the slider is: %d", _currentValue];
    
    UIAlertView *alertView = [[UIAlertView alloc]
    initWithTitle:@"Hello, World"
    message:message
    delegate:nil
    cancelButtonTitle:@"Awesome"
    otherButtonTitles:nil];
    [alertView show];
}

- (IBAction)sliderMoved:(UISlider *)slider {
    _currentValue = lroundf(slider.value);
}

@end
