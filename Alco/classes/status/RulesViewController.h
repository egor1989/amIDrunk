//
//  RulesViewController.h
//  Ersh
//
//  Created by Mike on 21.12.12.
//  Copyright (c) 2012 R&M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPageControl.h"
#import "PageViewManager.h"

@interface RulesViewController : UIViewController{
    PageViewManager *pageViewManager;
}

@property (strong, nonatomic) IBOutlet CustomPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
