//
//  SecondViewController.h
//  Alco
//
//  Created by Михаил Вакуленко on 01.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressViewWithOffset.h"
#import "Data.h"
#import "NSManagedObjectContext+insert.h"

@interface CentralViewController : UIViewController
@property IBOutlet ProgressViewWithOffset *progressView;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
