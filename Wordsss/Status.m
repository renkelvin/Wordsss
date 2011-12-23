//
//  Status.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/23/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Status.h"
#import "User.h"


@implementation Status

@dynamic day;
@dynamic lastViewed;
@dynamic level;
@dynamic dlc;
@dynamic user;

+ (Status*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    Status* entity = nil;
    
    entity = [NSEntityDescription insertNewObjectForEntityForName:@"Status" inManagedObjectContext:context];
    
    return entity;
}

@end
