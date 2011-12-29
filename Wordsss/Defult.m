//
//  Defult.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Defult.h"
#import "User.h"


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

@end
