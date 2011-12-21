//
//  HisData.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/22/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HisRecord, User;

@interface HisData : NSManagedObject

@property (nonatomic, retain) NSSet *hisRecord;
@property (nonatomic, retain) User *user;
@end

@interface HisData (CoreDataGeneratedAccessors)

- (void)addHisRecordObject:(HisRecord *)value;
- (void)removeHisRecordObject:(HisRecord *)value;
- (void)addHisRecord:(NSSet *)values;
- (void)removeHisRecord:(NSSet *)values;

@end
