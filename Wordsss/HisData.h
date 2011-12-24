//
//  HisData.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/24/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HisRecord, StaRecord, User;

@interface HisData : NSManagedObject

@property (nonatomic, retain) NSMutableSet *hisRecord;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSMutableSet *staRecord;
@end

@interface HisData (CoreDataGeneratedAccessors)

- (void)addHisRecordObject:(HisRecord *)value;
- (void)removeHisRecordObject:(HisRecord *)value;
- (void)addHisRecord:(NSSet *)values;
- (void)removeHisRecord:(NSSet *)values;

- (void)addStaRecordObject:(StaRecord *)value;
- (void)removeStaRecordObject:(StaRecord *)value;
- (void)addStaRecord:(NSSet *)values;
- (void)removeStaRecord:(NSSet *)values;

+ (HisData*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context;

@end
