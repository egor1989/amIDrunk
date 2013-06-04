//
//  CustomPageControl.h
//  Ersh
//
//  Created by Mike on 21.12.12.
//  Copyright (c) 2012 R&M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPageControl : UIPageControl {
    UIImage* mImageNormal;
    UIImage* mImageCurrent;
}

@property (nonatomic, readwrite, retain) UIImage* imageNormal;
@property (nonatomic, readwrite, retain) UIImage* imageCurrent;


@end
