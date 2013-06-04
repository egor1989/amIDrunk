//
//  CustomPageControl.m
//  Ersh
//
//  Created by Mike on 21.12.12.
//  Copyright (c) 2012 R&M. All rights reserved.
//

#import "CustomPageControl.h"

@interface CustomPageControl (Private)
- (void) updateDots;
@end


@implementation CustomPageControl

@synthesize imageNormal = mImageNormal;
@synthesize imageCurrent = mImageCurrent;

- (void) dealloc
{
    mImageNormal = nil;
    mImageCurrent = nil;
}


/** override to update dots */
- (void) setCurrentPage:(NSInteger)currentPage
{
    [super setCurrentPage:currentPage];
    
    // update dot views
    [self updateDots];
}

/** override to update dots */
- (void) setNumberOfPages:(NSInteger)number
{
    [super setNumberOfPages:number];
    
    // update dot views
    [self updateDots];
}

/** override to update dots */
- (void) updateCurrentPageDisplay
{
    [super updateCurrentPageDisplay];
    
    // update dot views
    [self updateDots];
}

/** Override setImageNormal */
- (void) setImageNormal:(UIImage*)image
{
    mImageNormal = image;
    
    // update dot views
    [self updateDots];
}

/** Override setImageCurrent */
- (void) setImageCurrent:(UIImage*)image
{
    mImageCurrent = image;
    
    // update dot views
    [self updateDots];
}

/** Override to fix when dots are directly clicked */
- (void) endTrackingWithTouch:(UITouch*)touch withEvent:(UIEvent*)event
{
    [super endTrackingWithTouch:touch withEvent:event];
    
    [self updateDots];
}

#pragma mark - (Private)

- (void) updateDots
{
    if(mImageCurrent || mImageNormal)
    {
        // Get subviews
        NSArray* dotViews = self.subviews;
        for(int i = 0; i < dotViews.count; ++i)
        {
            UIImageView* dot = [dotViews objectAtIndex:i];
            dot.frame = CGRectMake(dot.frame.origin.x, dot.frame.origin.y, mImageCurrent.size.width, mImageCurrent.size.height);
            // Set image
            dot.image = (i == self.currentPage) ? mImageCurrent : mImageNormal;
        }
    }
}

@end
