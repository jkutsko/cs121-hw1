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
    int _targetValue;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
	
}

- (void)startNewRound {
    _targetValue = 1 + arc4random_uniform(100);
    _currentValue = 50;
    self.slider.value = _currentValue;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateLabels {
    self.targetLabel.text = [NSString stringWithFormat:@"%d", _targetValue];
}

- (IBAction)showAlert {
    
    NSString *message = [NSString stringWithFormat:
        @"The value of the slider is: %d\nThe target value is: %d",
        _currentValue, _targetValue];
    
    UIAlertView *alertView = [[UIAlertView alloc]
    initWithTitle:@"Hello, World"
    message:message
    delegate:nil
    cancelButtonTitle:@"Awesome"
    otherButtonTitles:nil];
    [alertView show];
    [self startNewRound];
    [self updateLabels];
}

- (IBAction)sliderMoved:(UISlider *)slider {
    _currentValue = lroundf(slider.value);
}

@end
