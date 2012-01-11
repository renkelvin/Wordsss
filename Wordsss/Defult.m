//
//  Defult.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Defult.h"
#import "User.h"

static int freqArray[11] = {
    61854,      // 0  - 1     - Zero
    126,        // 1  - 800   - Basic
    70,         // 2  - 1500  - Middle
    34,         // 3  - 3000  - High
    23,         // 4  - 4000  - CET4
    14,         // 5  - 6000  - CET6
    9,          // 6  - 8000  - IELTS
    8,          // 7  - 9000  - TOFEL
    7,          // 8  - 10000 - SAT
    5,          // 9  - 12448 - GRE
    1           // 10 - 42814 - HolyShit
};

static int vocaArray[11] = {
    0,          // 0  - 1     - Zero
    800,        // 1  - 800   - Basic
    1500,       // 2  - 1500  - Middle
    3000,       // 3  - 3000  - High
    4000,       // 4  - 4000  - CET4
    6000,       // 5  - 6000  - CET6
    8000,       // 6  - 8000  - IELTS
    9000,       // 7  - 9000  - TOFEL
    10000,      // 8  - 10000 - SAT
    12000,      // 9  - 12448 - GRE
    40000       // 10 - 42814 - HolyShit
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
