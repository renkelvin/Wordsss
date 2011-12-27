//
//  Defult.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/23/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Defult.h"
#import "User.h"


@implementation Defult

@dynamic memDegree;
@dynamic user;

+ (Defult*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    Defult* entity = nil;
    
    entity = [NSEntityDescription insertNewObjectForEntityForName:@"Defult" inManagedObjectContext:context];
    
    return entity;
}

@end
