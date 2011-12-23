//
//  WordRecord.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/22/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "WordRecord.h"
#import "MemData.h"

static int deltaArray[10] = {1, 2, 3, 5, 7, 10, 15, 30, 60, 90};

@implementation WordRecord

@dynamic day;
@dynamic level;
@dynamic word_id;
@dynamic dlc;
@dynamic dls;
@dynamic memdata;

+ (WordRecord*)insertWordRecord:(Word*)word user:(User*)user inManagedObjectContext:(NSManagedObjectContext*)context
{
    WordRecord* wordRecord = nil;
    
    // Create
    wordRecord = [NSEntityDescription insertNewObjectForEntityForName:@"WordRecord" inManagedObjectContext:context];
    
    // Configure wordRecord
    wordRecord.word_id = word.id;
    wordRecord.level = [NSNumber numberWithInt:1];
    wordRecord.day = [NSNumber numberWithInt:[user.status.day intValue]];

    wordRecord.memdata = user.memdata;
    
    // Configure user
    [user.memdata.wordRecord addObject:wordRecord];
    
    //
    return wordRecord;
}

// Inc level 0,1-10,-1
- (void)levelInc
{
    // NEW set to 1
    if ([self.level intValue] == 0) {
        self.level = [NSNumber numberWithInt:1];
    }
    // GOT set to -1
    else if ([self.level intValue] == 10) {
        self.level = [NSNumber numberWithInt:-1];
    }
    // ERR set to -1
    else if ([self.level intValue] == -1) {
        self.level = [NSNumber numberWithInt:-1];
    }
    // NORMAL ++
    else {
        self.level = [NSNumber numberWithInt:([self.level intValue] + 1)];
    }
}

// Dec level 0,1-10,-1
- (void)levelDec
{
    // ERR set to 1
    if ([self.level intValue] == 0) {
        self.level = [NSNumber numberWithInt:1];
    }
    // 1 set to 1
    else if ([self.level intValue] == 1) {
        self.level = [NSNumber numberWithInt:1];
    }
    // ERR set to -1
    else if ([self.level intValue] == -1) {
        self.level = [NSNumber numberWithInt:-1];
    }
    // NORMAL --
    else {
        self.level = [NSNumber numberWithInt:([self.level intValue] - 1)];
    }
}

- (void)dlInc
{
    self.dlc = [NSNumber numberWithInt:([self.dlc intValue] + 1)];
    self.dls = [NSNumber numberWithInt:([self.dls intValue] + 1)];
}

- (void)dlDec
{
    self.dlc = [NSNumber numberWithInt:([self.dlc intValue] + 1)];
    self.dls = [NSNumber numberWithInt:([self.dls intValue] - 1)];
}

- (void)prepare
{
    self.dlc = [NSNumber numberWithInt:0];
    self.dls = [NSNumber numberWithInt:0];
}

- (void)cleardl
{
    self.dlc = [NSNumber numberWithInt:0];
    self.dls = [NSNumber numberWithInt:0];
}

- (int)delta
{
    if (1 <= [self.level intValue] && [self.level intValue] <= 10) {
        return deltaArray[[self.level intValue] - 1];
    }
    else if ([self.level intValue] == 0) {
        return 1;
    }
    else if ([self.level intValue] == -1) {
        return -1 - [self.day intValue];
    }
    else {
        self.level = [NSNumber numberWithInt:10];
        return deltaArray[[self.level intValue] - 1];
    }
}

- (void)nextDay
{
    self.day = [NSNumber numberWithInt:([self.day intValue] + [self delta])];
}

@end
