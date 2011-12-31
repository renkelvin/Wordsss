//
//  Defult.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Defult.h"
#import "User.h"

static int freqArray[11] = {61854,      // 0 - 1 - 
    126,        // 1 - 800 - Basic
    70,         // 2 - 1500 - Middle
    34,         // 3 - 3000 - High
    23,         // 4 - 4000 - CET4
    14,         // 5 - 6000 - CET6
    9,          // 6 - 8000 - 
    8,          // 7 - 9000 - TOFEL
    7,          // 8 - 10000
    5,          // 9 - 12448 - GRE
    1           // 10 - 42814
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

@end
