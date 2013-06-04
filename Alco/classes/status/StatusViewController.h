//
//  StatusViewController.h
//  Alco
//
//  Created by Михаил Вакуленко on 04.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPageControl.h"
#import "PageViewManager.h"

@interface StatusViewController : UIViewController{
    PageViewManager *pageViewManager;
}

@property (strong, nonatomic) IBOutlet CustomPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
