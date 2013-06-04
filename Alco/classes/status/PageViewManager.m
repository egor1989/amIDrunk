//
//  PageViewManager.m
//  GoodRoads
//
//  Created by Mike on 21.06.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PageViewManager.h"

@interface PageViewManager ()

- (void)pageControlChanged;

@end

@implementation PageViewManager

- (id)initWithScrollView:(UIScrollView*)scrollView
             pageControl:(UIPageControl*)pageControl
{
    self = [super init];
    if (self)
    {
        scrollView_ = scrollView;
        pageControl_ = pageControl;
        pageControlUsed_ = NO;
        pageIndex_ = 0;
        
        [pageControl_ addTarget:self action:@selector(pageControlChanged)
               forControlEvents:UIControlEventValueChanged];
    }
    return self;
}

/*  Setup the PageViewManager with an array of UIViews. */
- (void)loadPages:(NSArray*)pages{
    pages_ = pages;
    scrollView_.delegate = self;
    pageControl_.numberOfPages = [pages count];
    scrollView_.contentSize = CGSizeMake(scrollView_.frame.size.width * [pages_ count], scrollView_.frame.size.height);
    
    [pages_ enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop)
     {
         UIView* page = obj;
         
         [self addPage:page atNumber:index];
     }];
}

- (void) addPage: (UIView*) page atNumber: (int) number{
    //масштабирование
    CGFloat subviewWidth = page.frame.size.width;
    CGFloat subviewHeight = page.frame.size.height;
    CGFloat zoomW = scrollView_.frame.size.width / subviewWidth;
    CGFloat zoomH = scrollView_.frame.size.height / subviewHeight;
    CGFloat zoom = MIN(zoomH, zoomW);
    if (zoom < 1){
        subviewHeight = subviewHeight * zoom;
        subviewWidth = subviewWidth * zoom;
    }
    //центрирование
    CGFloat subviewHPosition = (scrollView_.frame.size.height - subviewHeight) / 2 ;
    CGFloat subviewWPosition = (scrollView_.frame.size.width - subviewWidth) / 2 ;
    page.frame = CGRectMake( scrollView_.frame.size.width * number + subviewWPosition, subviewHPosition,
                            subviewWidth, subviewHeight);
    [scrollView_ addSubview:page];

}

/*  Setup the PageViewManager with an array of UIViewControllers. */
- (void)loadControllerViews:(NSArray*)pageControllers
{
    NSMutableArray* pages = [NSMutableArray arrayWithCapacity:
                             pageControllers.count];
    [pageControllers enumerateObjectsUsingBlock:
     ^(id obj, NSUInteger idx, BOOL *stop)
     {
         UIViewController* controller = obj;
         [pages addObject:controller.view];
     }];
    
    [self loadPages:pages];
}

- (void)pageControlChanged
{
    pageIndex_ = pageControl_.currentPage;
    
    // Set the boolean used when scrolls originate from the page control.
    pageControlUsed_ = YES;
    
    // Update the scroll view to the appropriate page
    CGFloat pageWidth  = scrollView_.frame.size.width;
    CGFloat pageHeight = scrollView_.frame.size.height;
    CGRect rect = CGRectMake(pageWidth * pageIndex_, 0, pageWidth, pageHeight);
    [scrollView_ scrollRectToVisible:rect animated:YES];
    [[NSNotificationCenter defaultCenter]	postNotificationName:@"pageChanged"
                                                        object:nil];
}

- (void) scrollToBestCar: (int) carNumber{
    pageIndex_ = carNumber - 1;
    // Set the boolean used when scrolls originate from the page control.
    pageControlUsed_ = YES;
    
    // Update the scroll view to the appropriate page
    CGFloat pageWidth  = scrollView_.frame.size.width;
    CGFloat pageHeight = scrollView_.frame.size.height;
    CGRect rect = CGRectMake(pageWidth * pageIndex_, 0, pageWidth, pageHeight);
    [scrollView_ scrollRectToVisible:rect animated:NO];
}

- (void)scrollViewDidScroll:(UIScrollView*)sender
{
    // If the scroll was initiated from the page control, do nothing.
    if (!pageControlUsed_)
    {
        /*  Switch the page control when more than 50% of the previous/next
         page is visible. */
        CGFloat pageWidth = scrollView_.frame.size.width;
        CGFloat xOffset = scrollView_.contentOffset.x;
        int index = floor((xOffset - pageWidth/2) / pageWidth) + 1;
        if (index != pageIndex_)
        {
            pageIndex_ = index;
            pageControl_.currentPage = index;
        }
    }
    [[NSNotificationCenter defaultCenter]	postNotificationName:@"pageChanged"
                                                        object:nil];
}

- (void)scrollViewWillBeginDragging:(UIScrollView*)scrollView
{
    pageControlUsed_ = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
{
    pageControlUsed_ = NO;
}

@end