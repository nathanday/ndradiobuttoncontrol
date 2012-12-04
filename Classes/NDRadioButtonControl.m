/*
	NDRadioButtonControl.m

	Created by Nathan Day on 2.11.12 under a MIT-style license. 
	Copyright (c) 2012 Nathan Day

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
 */

#import "NDRadioButtonControl.h"

@interface NDRadioButtonControl ()
{
	NSUInteger		_selectedButtonIndex;
}

@end

@implementation NDRadioButtonControl

- (NSUInteger)selectedButtonTag { return self.selectedButton != nil ? self.selectedButton.tag : NSNotFound; }
- (UIButton *)selectedButton { return _selectedButtonIndex < self.subviews.count ? [self.subviews objectAtIndex:_selectedButtonIndex] : nil; }

- (void)setSelectedButtonTag:(NSUInteger)aSelectedButtonTag
{
	[self.subviews enumerateObjectsUsingBlock:^(UIButton * aButton, NSUInteger anIndex, BOOL * aStop)
	{
		if( aButton.tag == aSelectedButtonTag )
		{
			self.selectedButtonIndex = anIndex;
			*aStop = YES;
		}
	}];
}

- (void)setSelectedButton:(UIButton *)aSelectedButton
{
	[self.subviews enumerateObjectsUsingBlock:^(UIButton * aButton, NSUInteger anIndex, BOOL *aStop)
	{
		if( aButton == aSelectedButton )
		{
			self.selectedButtonIndex = anIndex;
			*aStop = YES;
		}
	}];
}

- (void)setSelectedButtonIndex:(NSUInteger)aSelectedButtonIndex
{
	UIButton	* theSelectedButton = nil;
	if( aSelectedButtonIndex < self.subviews.count )
		theSelectedButton = [self.subviews objectAtIndex:aSelectedButtonIndex];
	else
		aSelectedButtonIndex = NSNotFound;
	for( UIButton * theButton in self.subviews )
		 theButton.selected = theButton == theSelectedButton;
	_selectedButtonIndex = aSelectedButtonIndex;
}

- (id)initWithFrame:(CGRect)aFrame
{
    if( (self = [super initWithFrame:aFrame]) != nil)
		self.backgroundColor = [UIColor clearColor];
    return self;
}


- (void)addSubview:(UIView *)aButton
{
	UIButton	* theButton = (UIButton*)aButton;
	NSAssert( [theButton isKindOfClass:[UIButton class]], @"%@ can only have UIButton subviews, not %@", NSStringFromClass([self class]), NSStringFromClass([aButton class]) );
	if( self.subviews.count == 0 )
		theButton.selected = YES;
	else if( theButton.selected )
	{
		_selectedButtonIndex = self.subviews.count;
		for( UIButton * thePreviousButton in self.subviews )
			thePreviousButton.selected = NO;
	}
	[theButton addTarget:self action:@selector(buttonTouchUpInsideAction:forEvent:) forControlEvents:UIControlEventTouchUpInside];
	[theButton addTarget:self action:@selector(buttonTouchDownInsideAction:forEvent:) forControlEvents:UIControlEventTouchDown];
	[theButton addTarget:self action:@selector(buttonUpOutsideTouchDownAction:forEvent:) forControlEvents:UIControlEventTouchUpOutside];
	[theButton addTarget:self action:@selector(buttonUpOutsideTouchCancelAction:forEvent:) forControlEvents:UIControlEventTouchCancel];
	[theButton addTarget:self action:@selector(buttonUpOutsideTouchDownRepeatAction:forEvent:) forControlEvents:UIControlEventTouchDownRepeat];
	[super addSubview:theButton];
}

- (void)buttonTouchUpInsideAction:(UIButton *)aButton forEvent:(UIEvent *)anEvent
{
	[self setSelectedButton:aButton];
	[self sendActionsForControlEvents:UIControlEventTouchUpInside];
}
- (void)buttonTouchDownInsideAction:(UIButton *)aButton forEvent:(UIEvent *)anEvent
{
	for( UIButton * theButton in self.subviews )
		theButton.selected = theButton == aButton;
	[self sendActionsForControlEvents:UIControlEventTouchDown];
	[self sendActionsForControlEvents:UIControlEventValueChanged];
}
- (void)buttonUpOutsideTouchDownAction:(UIButton *)aButton forEvent:(UIEvent *)anEvent
{
	[self setSelectedButton:aButton];
	[self sendActionsForControlEvents:UIControlEventTouchUpOutside];
}
- (void)buttonUpOutsideTouchCancelAction:(UIButton *)aButton forEvent:(UIEvent *)anEvent
{
	[self setSelectedButton:aButton];
	[self sendActionsForControlEvents:UIControlEventTouchCancel];
}
- (void)buttonUpOutsideTouchDownRepeatAction:(UIButton *)aButton forEvent:(UIEvent *)anEvent
{
	[self setSelectedButton:aButton];
	[self sendActionsForControlEvents:UIControlEventTouchDownRepeat];
}

@end
