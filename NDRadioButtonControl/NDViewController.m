//
//  NDViewController.m
//  NDRadioButtonControl
//
//  Created by Nathan Day on 4/12/12.
//  Copyright (c) 2012 Nathan Day. All rights reserved.
//

#import "NDViewController.h"
#import "NDRadioButtonControl.h"

static NSString					* const kResetKeyPath = @"resetKeyPath";
static const NSTimeInterval		kResetTimeInterval = 0.5;

@interface NDViewController ()

@end

@implementation NDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self updateButtonInfo];
}

- (IBAction)touchUpInsideAction:(id)sender
{
	[self updateButtonInfo];
	self.upInsideLabel.enabled = YES;
	[NSTimer scheduledTimerWithTimeInterval:kResetTimeInterval target:self selector:@selector(resetFlagsTimer:) userInfo:[NSDictionary dictionaryWithObject:@"upInsideLabel.enabled" forKey:kResetKeyPath] repeats:NO];
}

- (IBAction)touchDownAction:(id)sender
{
	self.downLabel.enabled = YES;
	[NSTimer scheduledTimerWithTimeInterval:kResetTimeInterval target:self selector:@selector(resetFlagsTimer:) userInfo:[NSDictionary dictionaryWithObject:@"downLabel.enabled" forKey:kResetKeyPath] repeats:NO];
}

- (IBAction)eventValueChangedAction:(id)sender
{
	self.valueChangedLabel.enabled = YES;
	[NSTimer scheduledTimerWithTimeInterval:kResetTimeInterval target:self selector:@selector(resetFlagsTimer:) userInfo:[NSDictionary dictionaryWithObject:@"valueChangedLabel.enabled" forKey:kResetKeyPath] repeats:NO];
}

- (IBAction)touchUpOutsideAction:(id)sender
{
	self.upInsideLabel.enabled = YES;
	[NSTimer scheduledTimerWithTimeInterval:kResetTimeInterval target:self selector:@selector(resetFlagsTimer:) userInfo:[NSDictionary dictionaryWithObject:@"upInsideLabel.enabled" forKey:kResetKeyPath] repeats:NO];
}

- (IBAction)touchCancelAction:(id)sender
{
	self.cancelLabel.enabled = YES;
	[NSTimer scheduledTimerWithTimeInterval:kResetTimeInterval target:self selector:@selector(resetFlagsTimer:) userInfo:[NSDictionary dictionaryWithObject:@"cancelLabel.enabled" forKey:kResetKeyPath] repeats:NO];
}

- (IBAction)touchDownRepeatAction:(id)sender
{
	self.downRepeatLabel.enabled = YES;
	[NSTimer scheduledTimerWithTimeInterval:kResetTimeInterval target:self selector:@selector(resetFlagsTimer:) userInfo:[NSDictionary dictionaryWithObject:@"downRepeatLabel.enabled" forKey:kResetKeyPath] repeats:NO];
}

- (void)resetFlagsTimer:(NSTimer *)aTimer
{
	[self setValue:[NSNumber numberWithBool:NO] forKeyPath:[aTimer.userInfo objectForKey:kResetKeyPath]];
}

- (void)updateButtonInfo
{
	self.nameLabel.text = self.radioButtonControl.selectedButton.titleLabel.text;
	self.tagLabel.text = [NSString stringWithFormat:@"%u", self.radioButtonControl.selectedButtonTag];
	self.indexLabel.text = [NSString stringWithFormat:@"%u", self.radioButtonControl.selectedButtonIndex];
}

@end
