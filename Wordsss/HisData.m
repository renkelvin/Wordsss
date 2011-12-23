//
//  HisData.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/22/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "HisData.h"
#import "HisRecord.h"
#import "User.h"


@implementation HisData

@dynamic hisRecord;
@dynamic user;

+ (HisData*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    HisData* entity = nil;
    
    entity = [NSEntityDescription insertNewObjectForEntityForName:@"HisData" inManagedObjectContext:context];
    
    return entity;
}

@end
