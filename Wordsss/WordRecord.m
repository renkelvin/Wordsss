//
//  WordRecord.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "WordRecord.h"
#import "MemData.h"


@implementation WordRecord

@dynamic day;
@dynamic id;
@dynamic level;
@dynamic word_id;
@dynamic memdata;

+ (WordRecord*)insertWordRecord:(Word*)word user:(User*)user inManagedObjectContext:(NSManagedObjectContext*)context
{
    WordRecord* wordRecord = nil;
    
    // Create
    wordRecord = [NSEntityDescription insertNewObjectForEntityForName:@"WordRecord" inManagedObjectContext:context];
    
    // Configure wordRecord
    wordRecord.word_id = word.id;
    wordRecord.memdata = user.memdata;
    
    // Configure user
    [user.memdata.wordRecord addObject:wordRecord];
    
    //
    return wordRecord;
}

@end
