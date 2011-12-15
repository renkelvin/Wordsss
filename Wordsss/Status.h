//
//  Status.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Status : NSManagedObject

@property (nonatomic, retain) NSNumber * day;
@property (nonatomic, retain) User *user;

+ (Status*)insertStatus:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context;

@end
