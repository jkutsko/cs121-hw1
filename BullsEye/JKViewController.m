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
    int _score;
    int _round;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewGame];
    [self updateLabels];
    UIImage *thumbImageNormal = [UIImage imageNamed:@"SliderThumb-Normal"];
    [self.slider setThumbImage:thumbImageNormal forState:UIControlStateNormal];
    UIImage *thumbImageHighlighted = [UIImage imageNamed:@"SliderThumb-Highlighted"];
    [self.slider setThumbImage:thumbImageHighlighted forState:UIControlStateHighlighted];
    UIImage *trackLeftImage =
    [[UIImage imageNamed:@"SliderTrackLeft"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMinimumTrackImage:trackLeftImage forState:UIControlStateNormal];
    UIImage *trackRightImage =
    [[UIImage imageNamed:@"SliderTrackRight"]
     resizableImageWithCapInsets:UIEdgeInsetsMake(0, 14, 0, 14)];
    [self.slider setMaximumTrackImage:trackRightImage forState:UIControlStateNormal];
	
}
     
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewRound];
    [self updateLabels];
}

- (void)startNewRound {
    _round += 1;
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
    
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", _score];
    
    self.roundLabel.text = [NSString stringWithFormat:@"%d", _round];

}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (IBAction)startOver {
    CATransition *transition = [CATransition animation]; transition.type = kCATransitionFade; transition.duration = 1;
    transition.timingFunction = [CAMediaTimingFunction
                                 functionWithName:kCAMediaTimingFunctionEaseOut]; [self startNewGame];
    [self updateLabels];
    [self.view.layer addAnimation:transition forKey:nil];
}

- (IBAction)showAlert {
    
    int difference = abs(_currentValue - _targetValue);
    int points = 100 - difference;
    _score += points;
    
    NSString *title;
    if (difference == 0) { title = @"Perfect!";
    } else if (difference < 5) {
        title = @"You almost had it!";
    } else if (difference < 10) {
        title = @"Pretty good!";
    } else {
        title = @"Not even close...";
    }
    
    NSString *message = [NSString stringWithFormat:
        @"You scored %d points",
         points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
    initWithTitle:title
    message:message
    delegate:self
    cancelButtonTitle:@"Awesome"
    otherButtonTitles:nil];
    [alertView show];
    
}

- (IBAction)sliderMoved:(UISlider *)slider {
    _currentValue = lroundf(slider.value);
}


- (void)startNewGame {
    _score = 0;
    _round = 0;
    [self startNewRound];
}

@end
