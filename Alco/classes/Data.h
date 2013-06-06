//
//  Data.h
//  Alco
//
//  Created by Михаил Вакуленко on 06.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Data : NSManagedObject

@property (nonatomic) int64_t timestamp;
@property (nonatomic) double lat;
@property (nonatomic) double lng;
@property (nonatomic, retain) NSString * place_name;
@property (nonatomic) float ppm;

@end
