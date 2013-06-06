//
//  NSManagedObjectContext+insert.m
//  Alco
//
//  Created by Михаил Вакуленко on 06.06.13.
//  Copyright (c) 2013 peacock. All rights reserved.
//

#import "NSManagedObjectContext+insert.h"

@implementation NSManagedObjectContext (insert)

-(NSManagedObject *) insertNewEntityWithName:(NSString *)name
{
    return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:self];
}

@end
