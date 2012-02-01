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

#import "MNMProgressBar.h"

/**
 * Constant that defines indeterminate progress
 */
const CGFloat MNMProgressBarIndeterminateProgress = -1.0f;

@implementation MNMProgressBar

@synthesize progress = progress_;

#pragma mark -
#pragma mark Memory management

/**
 * Deallocates used memory
 */
- (void)dealloc {
    [backgroundImageView_ release];
    backgroundImageView_ = nil;
    
    [progressImageView_ release];
    progressImageView_ = nil;
        
    [progressImage_ release];
    progressImage_ = nil;
    
    [indeterminateImages_ release];
    indeterminateImages_ = nil;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Instance initialization

/*
 * Creates and initializes an instance of MNMProgressBar
 */
- (id)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
                        
        progressImage_ = [[[UIImage imageNamed:@"progress_fill.png"] stretchableImageWithLeftCapWidth:2 topCapHeight:0] retain]; 
        
        indeterminateImages_ = [[NSMutableArray alloc] init];
        
        for (int i = 1; i < 10; i++) {
            
            NSString *name = [NSString stringWithFormat:@"progress_frame%i.png", i];   
            
            [indeterminateImages_ addObject:[UIImage imageNamed:name]];
        }
                
        backgroundImageView_ = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        backgroundImageView_.image = [[UIImage imageNamed:@"progress_background.png"] stretchableImageWithLeftCapWidth:2 topCapHeight:0];
        
        [self addSubview:backgroundImageView_];
        
        progressImageView_ = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 0.0f, frame.size.height)];
        progressImageView_.animationDuration = 0.25f;
        
        [self addSubview:progressImageView_];
        
        self.progress = 0.0f;
    }
         
    return self;
}

#pragma mark -
#pragma mark Properties

/**
 * Set the progress of the bar
 *
 * @param progress Value of the current progress
 */
- (void)setProgress:(CGFloat)progress {
    
    if (progress_ != progress) {
                
        if (progress == MNMProgressBarIndeterminateProgress) {
            
            progressImageView_.image = nil;
            progressImageView_.animationImages = indeterminateImages_;
            
            CGRect frame = progressImageView_.frame;
            frame.origin.x = 0.0f;
            frame.origin.y = 0.0f;        
            frame.size.height = CGRectGetHeight(backgroundImageView_.frame);
            frame.size.width = CGRectGetWidth(backgroundImageView_.frame);
            progressImageView_.frame = frame;
        
            [progressImageView_ startAnimating];
            
        } else if (progress >= 0.0f && progress <= 1.0f) {
            
            [progressImageView_ stopAnimating];
            
            progressImageView_.image = progressImage_;
            progressImageView_.animationImages = nil;
            
            CGRect frame = progressImageView_.frame;
            frame.origin.x = 2.0f;
            frame.origin.y = 2.0f;
            frame.size.height = CGRectGetHeight(backgroundImageView_.frame) - 4.0f;
            progressImageView_.frame = frame;
            
            [UIView animateWithDuration:(progress == MNMProgressBarIndeterminateProgress ? 0.1f : 0.0f) animations:^{
                
                CGRect frame = progressImageView_.frame;
                frame.size.width = (CGRectGetWidth(backgroundImageView_.frame) - 4.0f) * progress;
                progressImageView_.frame = frame;   
            }];
        }
        
        progress_ = progress;
    } 
}

@end
