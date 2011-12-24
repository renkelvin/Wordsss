//
//  StaRecord.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/24/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "StaRecord.h"
#import "HisData.h"


@implementation StaRecord

@dynamic day;
@dynamic date;
@dynamic dlc;
@dynamic hisData;

+ (StaRecord*)insertStaRecord:(User*)user inManagedObjectContext:(NSManagedObjectContext*)context
{
    StaRecord* staRecord = nil;
    
    // Create
    staRecord = [NSEntityDescription insertNewObjectForEntityForName:@"StaRecord" inManagedObjectContext:context];
    
    // Configure wordRecord
    staRecord.day = user.status.day;
    staRecord.date = user.status.date;
    staRecord.dlc = user.status.dlc;
    
    staRecord.hisData = user.hisdata;
    
    // Configure user
    [user.hisdata.staRecord addObject:staRecord];
    
    //
    return staRecord;
}

@end
