//
//  MemData.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "MemData.h"
#import "User.h"
#import "WordRecord.h"


@implementation MemData

@dynamic user;
@dynamic wordRecord;

+ (MemData*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    MemData* entity = nil;
    
    entity = [NSEntityDescription insertNewObjectForEntityForName:@"MemData" inManagedObjectContext:context];
    
    return entity;
}

@end
