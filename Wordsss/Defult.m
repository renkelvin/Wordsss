//
//  Defult.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Defult.h"
#import "User.h"

static int freqArray[13] = {
    61854,      // 0    - Zero
    126,        // 1    - Basic
    70,         // 2    - Middle
    34,         // 3    - High
    23,         // 4    - CET4
    14,         // 5    - CET6
    8,          // 6    - GET
    8,          // 7    - IELTS
    8,          // 8    - TOEFL
    8,          // 9    - SAT
    3,          // 10   - GRE
    3,          // 11   - GMAT
    1           // 12   - HolyShit
};

static int vocaArray[13] = {
    0,          // 0    - Zero
    800,        // 1    - Basic
    1500,       // 2    - Middle
    3000,       // 3    - High
    4000,       // 4    - CET4
    6000,       // 5    - CET6
    10000,      // 6    - GET
    10000,      // 7    - IELTS
    10000,      // 8    - TOEFL
    10000,      // 9    - SAT
    20000,      // 10   - GRE
    20000,      // 11   - GMAT
    40000       // 12   - HolyShit
};

static char* fieldArray[13] = {
    "zero",     // 0    - Zero
    "basic",    // 1    - Basic
    "middle",   // 2    - Middle
    "high",     // 3    - High
    "cet4",     // 4    - CET4
    "cet6",     // 5    - CET6
    "get",      // 6    - GET
    "ielts",    // 7    - IELTS
    "tofel",    // 8    - TOEFL
    "sat",      // 9    - SAT
    "gre",      // 10    - GRE
    "gmat",     // 11    - GRE
    "holyshit"  // 12   - HolyShit
};

@implementation Defult

@dynamic currentLevel;
@dynamic currentVocabulary;
@dynamic memDegree;
@dynamic targetLevel;
@dynamic targetVocabulary;
@dynamic user;

+ (Defult*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    Defult* entity = nil;
    
    entity = [NSEntityDescription insertNewObjectForEntityForName:@"Defult" inManagedObjectContext:context];
    
    entity.memDegree = [NSNumber numberWithFloat:0.5];
    
    return entity;
}

- (NSString*)fieldTarget
{
    return [NSString stringWithUTF8String:fieldArray[[self.targetLevel intValue]]];
}

- (int)freqCurrent
{
    return freqArray[[self.currentLevel intValue]];
}

- (int)freqTarget
{
    return freqArray[[self.targetLevel intValue]];
}

- (int)vocaCurrent
{
    int voca = vocaArray[[self.currentLevel intValue]];
    
    self.currentVocabulary = [NSNumber numberWithInt:voca];
    
    return voca;
}

- (int)vocaTarget
{
    int voca = vocaArray[[self.targetLevel intValue]];
    
    self.targetVocabulary = [NSNumber numberWithInt:voca];
    
    return voca;
}

@end
