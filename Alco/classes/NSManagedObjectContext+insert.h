//
//  NSManagedObjectContext+insert.h
//  Alco
//
//  Created by Михаил Вакуленко on 06.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (insert)
-(NSManagedObject *) insertNewEntityWithName:(NSString *)name;

@end
