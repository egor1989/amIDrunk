//
//  HistoryCell.h
//  Alco
//
//  Created by Михаил Вакуленко on 06.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *promille;
@property (strong, nonatomic) IBOutlet UILabel *place;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *time;

@end
