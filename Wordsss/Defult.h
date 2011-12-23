//
//  Defult.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/23/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Defult : NSManagedObject

@property (nonatomic, retain) NSNumber * targetMemDegree;
@property (nonatomic, retain) User *user;

+ (Defult*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context;

@end
