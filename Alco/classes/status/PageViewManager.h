//
//  PageViewManager.h
//  GoodRoads
//
//  Created by Mike on 21.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageViewManager : NSObject <UIScrollViewDelegate>
{
    UIScrollView* scrollView_;
    UIPageControl* pageControl_;
    NSArray* pages_;
    BOOL pageControlUsed_;
    NSInteger pageIndex_;
}

- (id)initWithScrollView:(UIScrollView*)scrollView
             pageControl:(UIPageControl*)pageControl;
- (void)loadPages:(NSArray*)pages;
- (void) addPage: (UIView*) page atNumber: (int) number;
- (void)loadControllerViews:(NSArray*)pageControllers;
- (void) scrollToBestCar: (int) carNumber;

@end
