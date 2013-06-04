//
//  ProgressViewWithOffset.m
//  Alco
//
//  Created by Михаил Вакуленко on 04.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import "ProgressViewWithOffset.h"

#define fillOffsetX 2
#define fillOffsetY 2

@implementation ProgressViewWithOffset

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
	// Draw the background in the current rect
	[self.trackImage drawInRect:rect];
	
	// Create the rectangle for our fill image accounting for the position offsets,
	// 1 in the X direction and 1, 3 on the top and bottom for the Y.
	CGRect fillRect = CGRectMake(rect.origin.x + fillOffsetX,
								 rect.origin.y + fillOffsetY,
								 rect.size.width*self.progress - fillOffsetX*2,
								 rect.size.height - fillOffsetY*2);
	
	// Draw the fill
	[self.progressImage drawInRect:fillRect];
}


@end
