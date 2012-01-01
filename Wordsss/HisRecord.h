//
//  HisRecord.h
//  Wordsss
//
//  Created by Ren Chuan on 1/1/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "WordRecord.h"

@class HisData;

@interface HisRecord : NSManagedObject

@property (nonatomic, retain) NSNumber * day;
@property (nonatomic, retain) NSNumber * dlc;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSNumber * word_id;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) HisData *hisData;

+ (HisRecord*)insertHisRecord:(WordRecord*)wordRecord user:(User*)user inManagedObjectContext:(NSManagedObjectContext*)context;

@end
