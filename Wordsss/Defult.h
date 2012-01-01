//
//  Defult.h
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Defult : NSManagedObject

@property (nonatomic, retain) NSNumber * currentLevel;
@property (nonatomic, retain) NSNumber * currentVocabulary;
@property (nonatomic, retain) NSNumber * memDegree;
@property (nonatomic, retain) NSNumber * targetLevel;
@property (nonatomic, retain) NSNumber * targetVocabulary;
@property (nonatomic, retain) User *user;

+ (Defult*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context;

- (int)freqCurrent;
- (int)freqTarget;
- (int)vocaCurrent;
- (int)vocaTarget;

@end
