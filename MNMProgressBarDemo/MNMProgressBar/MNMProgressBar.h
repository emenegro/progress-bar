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

#import <Foundation/Foundation.h>

/**
 * Constant that defines indeterminate progress
 */
extern const CGFloat MNMProgressBarIndeterminateProgress;

/**
 * Custom progress bar view that shows a determinate progress and an indeterminate one
 */
@interface MNMProgressBar : UIView {
@private
    /**
     * Background image view
     */
    UIImageView *backgroundImageView_;
    
    /**
     * Progress image view
     */
    UIImageView *progressImageView_;
    
    /**
     * Image of the progress. Grows depending on value of progress_
     */
    UIImage *progressImage_;
    
    /**
     * Array of images to animate the indeterminate progress
     */
    NSMutableArray *indeterminateImages_;
        
    /**
     * Value of the progress. Takes values between 0.0f and 1.0f. 
     * It can also takes ProgressBarViewIndeterminateProgress
     */
    CGFloat progress_;
}

/**
 * Provides radwrite access to progress_
 */
@property (nonatomic, readwrite, assign) CGFloat progress;

@end
