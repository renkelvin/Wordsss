//
//  HisRecord.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/22/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "HisRecord.h"
#import "HisData.h"


@implementation HisRecord

@dynamic word_id;
@dynamic day;
@dynamic level;
@dynamic hisData;

+ (HisRecord*)insertHisRecord:(WordRecord*)wordRecord user:(User*)user inManagedObjectContext:(NSManagedObjectContext*)context
{
    HisRecord* hisRecord = nil;
    
    // Create
    hisRecord = [NSEntityDescription insertNewObjectForEntityForName:@"HisRecord" inManagedObjectContext:context];
    
    // Configure hisRecord
    hisRecord.word_id = wordRecord.word_id;
    hisRecord.day = wordRecord.day;
    hisRecord.level = wordRecord.level;
    
    hisRecord.hisData = user.hisdata;
    
    // Configure user
    [user.hisdata.hisRecord addObject:hisRecord];
    
    //
    return hisRecord;
}

@end
