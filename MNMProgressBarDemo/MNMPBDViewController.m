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

#import "MNMPBDViewController.h"
#import "MNMProgressBar.h"

#define PROGRESS_INDETERMINATE_BUTTON_ON_TEXT_KEY               @"PROGRESS_INDETERMINATE_BUTTON_ON_TEXT"
#define PROGRESS_INDETERMINATE_BUTTON_OFF_TEXT_KEY              @"PROGRESS_INDETERMINATE_BUTTON_OFF_TEXT"
#define PROGRESS_SLIDER_INFO_TEXT_KEY                           @"PROGRESS_SLIDER_INFO_TEXT"

@implementation MNMPBDViewController

@synthesize progressSliderInfoLabel = progressSliderInfoLabel_;
@synthesize progressSlider = progressSlider_;
@synthesize progressIndeterminateButton = progressIndeterminateButton_;

#pragma mark -
#pragma mark Memory management

/**
 * Deallocates the memory occupied by the receiver.
 */
- (void)dealloc {    
    [progressBar_ release];
    progressBar_ = nil;
    
    [progressSliderInfoLabel_ release];
    progressSliderInfoLabel_ = nil;
    
    [progressSlider_ release];
    progressSlider_ = nil;
    
    [progressIndeterminateButton_ release];
    progressIndeterminateButton_ = nil;
        
    [super dealloc];
}

#pragma mark -
#pragma mark View lifecycle

/**
 * Called after the controller’s view is loaded into memory.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    progressSliderInfoLabel_.text = NSLocalizedString(PROGRESS_SLIDER_INFO_TEXT_KEY, nil);
    
    [progressIndeterminateButton_ setTitle:NSLocalizedString(PROGRESS_INDETERMINATE_BUTTON_OFF_TEXT_KEY, nil) forState:UIControlStateNormal];
    
    progressBar_ = [[MNMProgressBar alloc] initWithFrame:CGRectMake(30.0f, 60.0f, CGRectGetWidth(self.view.frame) - 60.0f, 16.0f)];
        
    [self.view addSubview:progressBar_];
}

/**
 * Called when the controller’s view is released from memory.
 */
- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.progressSliderInfoLabel = nil;
    self.progressSlider = nil;
    self.progressIndeterminateButton = nil;
    
    [progressBar_ release];
    progressBar_ = nil;
}

#pragma mark -
#pragma mark User interaction

/*
 * progressSlider_ changed value
 */
- (IBAction)progressSliderValueChanged {
    
    progressIndeterminateButton_.selected = YES;
    
    [self progressIndeterminateButtonTouchUpInside];
    
    progressBar_.progress = progressSlider_.value;
}

/*
 * progressIndeterminateButton_ was touched up inside
 */
- (IBAction)progressIndeterminateButtonTouchUpInside {
    
    progressIndeterminateButton_.selected = !progressIndeterminateButton_.selected;
    
    if (progressIndeterminateButton_.selected) {
    
        [progressIndeterminateButton_ setTitle:NSLocalizedString(PROGRESS_INDETERMINATE_BUTTON_ON_TEXT_KEY, nil) forState:UIControlStateNormal];
        
        progressBar_.progress = MNMProgressBarIndeterminateProgress;
        
    } else {
        
        [progressIndeterminateButton_ setTitle:NSLocalizedString(PROGRESS_INDETERMINATE_BUTTON_OFF_TEXT_KEY, nil) forState:UIControlStateNormal];
        
        progressBar_.progress = progressSlider_.value;
    }
}

@end
