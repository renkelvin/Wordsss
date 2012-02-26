//
//  HisData.h
//  Wordsss
//
//  Created by Ren Chuan on 2/25/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HisRecord, SearchHis, StaRecord, User;

@interface HisData : NSManagedObject

@property (nonatomic, retain) NSMutableSet *hisRecord;
@property (nonatomic, retain) NSMutableSet *staRecord;
@property (nonatomic, retain) User *user;
@property (nonatomic, retain) NSMutableSet *searchHis;
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

- (void)addSearchHisObject:(SearchHis *)value;
- (void)removeSearchHisObject:(SearchHis *)value;
- (void)addSearchHis:(NSSet *)values;
- (void)removeSearchHis:(NSSet *)values;

+ (HisData*)insertEntity:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context;

@end
