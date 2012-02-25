//
//  HisData.m
//  Wordsss
//
//  Created by Ren Chuan on 2/25/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "HisData.h"
#import "HisRecord.h"
#import "SearchHis.h"
#import "StaRecord.h"
#import "User.h"


@implementation HisData

@dynamic hisRecord;
@dynamic staRecord;
@dynamic user;
@dynamic searchHis;

+ (HisData*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    HisData* entity = nil;
    
    entity = [NSEntityDescription insertNewObjectForEntityForName:@"HisData" inManagedObjectContext:context];
    
    return entity;
}

@end
