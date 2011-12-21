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

- (void)levelInc
{
    switch ([self.level intValue]) {
        case 0:     // Error! nothing happened
            break;
        case 1:
            self.level = [NSNumber numberWithInt:2];
            break;
        case 2:
            self.level = [NSNumber numberWithInt:3];
            break;
        case 3:
            self.level = [NSNumber numberWithInt:5];
            break;
        case 5:
            self.level = [NSNumber numberWithInt:7];
            break;
        case 7:
            self.level = [NSNumber numberWithInt:15];
            break;
        case 15:
            self.level = [NSNumber numberWithInt:30];
            break;
        case 30:
            self.level = [NSNumber numberWithInt:60];
            break;
        case 60:
            self.level = [NSNumber numberWithInt:90];
            break;
        case 90:
            self.level = [NSNumber numberWithInt:-1];
            break;
        case -1:    // Error! still -1
            self.level = [NSNumber numberWithInt:-1];
            break;
        default:    // Error!
            self.level = [NSNumber numberWithInt:90];
            break;
    }
}

- (void)levelDec
{

}

@end
