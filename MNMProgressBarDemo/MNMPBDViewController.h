/*
 * Copyright (c) 2012 Mario Negro Martín
 * 
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 
 */

#import <UIKit/UIKit.h>

@class MNMProgressBar;

/**
 * View controller to show example of MNMProgressBar
 */
@interface MNMPBDViewController : UIViewController {
@private
    /**
     * The progress bar control
     */
    MNMProgressBar *progressBar_;
    
    /**
     * Label with a text explaining how to show a certain progress
     */
    UILabel *progressSliderInfoLabel_;
    
    /**
     * Slider to change progress of the bar
     */
    UISlider *progressSlider_;
    
    /**
     * Toggles determinate and indeterminate progress
     */
    UIButton *progressIndeterminateButton_;
}

/**
 * Provides readwrite access to progressSliderInfoLabel_. Exported to IB
 */
@property (nonatomic, readwrite, retain) IBOutlet UILabel *progressSliderInfoLabel;

/**
 * Provides readwrite access to progressSlider_. Exported to IB
 */
@property (nonatomic, readwrite, retain) IBOutlet UISlider *progressSlider;

/**
 * Provides readwrite access to progressIndeterminateButton_. Exported to IB
 */
@property (nonatomic, readwrite, retain) IBOutlet UIButton *progressIndeterminateButton;

/**
 * progressSlider_ changed value
 */
- (IBAction)progressSliderValueChanged;

/**
 * progressIndeterminateButton_ was touched up inside
 */
- (IBAction)progressIndeterminateButtonTouchUpInside;

@end
