//
//  HisRecord.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/24/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "HisRecord.h"
#import "HisData.h"


@implementation HisRecord

@dynamic day;
@dynamic level;
@dynamic word_id;
@dynamic dlc;
@dynamic hisData;

+ (HisRecord*)insertHisRecord:(WordRecord*)wordRecord user:(User*)user inManagedObjectContext:(NSManagedObjectContext*)context
{
    HisRecord* hisRecord = nil;
    
    // Create
    hisRecord = [NSEntityDescription insertNewObjectForEntityForName:@"HisRecord" inManagedObjectContext:context];
    
    // Configure wordRecord
    hisRecord.word_id = wordRecord.word_id;
    hisRecord.level = wordRecord.level;
    hisRecord.day = wordRecord.day;
    
    hisRecord.hisData = user.hisdata;
    
    // Configure user
    [user.hisdata.hisRecord addObject:hisRecord];
    
    //
    return hisRecord;
}

@end
