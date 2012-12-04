/*
	NDRadioButtonControl.h

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

#import <UIKit/UIKit.h>

/**
 The class NDRadioButtonControl is a subclass of <tt>UIControl</tt> set selected of any button directly contrained in it <tt>YES</tt> , and set all other buttons to selected = <tt>NO</tt>, making the buttons contained in <t>NDRadioButtonControl</tt> act as radio buttons.
 NDRadioButtonControl can have targets added to it for the events UIControlEventTouchUpInside, UIControlEventTouchDown, UIControlEventValueChanged, UIControlEventTouchUpOutside, UIControlEventTouchCancel, UIControlEventTouchDownRepeat. You can also add tarted directly to the butotns.
 You can only add UIButtons to NDRadioButtonControl.
 NDRadioButtonControl can be created and have buttons added the same way you do with any kind of UIView, alternativly you can create a view in interface builder and change it class to NDRadioButtonControl.
 */
@interface NDRadioButtonControl : UIControl

/**
 Tag of currently selected button, equivelent to <tt>[[<reciever>.subviews objectAtIndex:selectedButtonTag] tag]</tt>.
 */
@property(assign,nonatomic)		NSUInteger		selectedButtonTag;
/**
 Currently selected button.
 */
@property(assign,nonatomic)		UIButton		* selectedButton;
/**
 Index of currently selected button, passing this value to [<reciever>.subviews objectAtIndex:selectedButtonTag] will return the button.
 */
@property(assign,nonatomic)		NSUInteger		selectedButtonIndex;

@end
