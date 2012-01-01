//
//  HisRecord.m
//  Wordsss
//
//  Created by Ren Chuan on 1/1/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "HisRecord.h"
#import "HisData.h"


@implementation HisRecord

@dynamic day;
@dynamic dlc;
@dynamic level;
@dynamic word_id;
@dynamic date;
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
    hisRecord.date = user.status.date;
    
    hisRecord.hisData = user.hisdata;
    
    // Configure user
    [user.hisdata.hisRecord addObject:hisRecord];
    
    //
    return hisRecord;
}

@end
