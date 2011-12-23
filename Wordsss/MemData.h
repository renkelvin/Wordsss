//
//  MemData.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User, WordRecord;

@interface MemData : NSManagedObject

@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSMutableSet *wordRecord;
@end

@interface MemData (CoreDataGeneratedAccessors)

+ (MemData*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context;

- (void)addWordRecordObject:(WordRecord *)value;
- (void)removeWordRecordObject:(WordRecord *)value;
- (void)addWordRecord:(NSSet *)values;
- (void)removeWordRecord:(NSSet *)values;

@end
