//
//  NDViewController.h
//  NDRadioButtonControl
//
//  Created by Nathan Day on 4/12/12.
//  Copyright (c) 2012 Nathan Day. All rights reserved.
//

#import <UIKit/UIKit.h>


@class		NDRadioButtonControl;

@interface NDViewController : UIViewController

@property (weak, nonatomic) IBOutlet NDRadioButtonControl * radioButtonControl;

@property (weak, nonatomic) IBOutlet UILabel	* nameLabel;
@property (weak, nonatomic) IBOutlet UILabel	* tagLabel;
@property (weak, nonatomic) IBOutlet UILabel	* indexLabel;

@property (weak, nonatomic) IBOutlet UILabel	* upInsideLabel;
@property (weak, nonatomic) IBOutlet UILabel	* downLabel;
@property (weak, nonatomic) IBOutlet UILabel	* valueChangedLabel;
@property (weak, nonatomic) IBOutlet UILabel	* upOutsideLabel;
@property (weak, nonatomic) IBOutlet UILabel	* cancelLabel;
@property (weak, nonatomic) IBOutlet UILabel	* downRepeatLabel;

- (IBAction)touchUpInsideAction:(id)sender;
- (IBAction)touchDownAction:(id)sender;
- (IBAction)eventValueChangedAction:(id)sender;
- (IBAction)touchUpOutsideAction:(id)sender;
- (IBAction)touchCancelAction:(id)sender;
- (IBAction)touchDownRepeatAction:(id)sender;

@end
