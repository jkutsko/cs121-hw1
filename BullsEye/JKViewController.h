//
//  JKViewController.h
//  BullsEye
//
//  Created by Guest User on 9/4/14.
//  Copyright (c) 2014 Josh Kutsko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKViewController : UIViewController

@property (nonatomic, weak) IBOutlet UISlider *slider;

- (IBAction)showAlert;

- (IBAction)sliderMoved:(UISlider *)slider;

@end
