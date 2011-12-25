//
//  StaRecord.h
//  Wordsss
//
//  Created by Ren Chuan on 12/25/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "User.h"
#import "Status.h"
#import "HisData.h"

@class HisData;

@interface StaRecord : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * day;
@property (nonatomic, retain) NSNumber * dlc;
@property (nonatomic, retain) NSNumber * count0;
@property (nonatomic, retain) NSNumber * count1;
@property (nonatomic, retain) NSNumber * count2;
@property (nonatomic, retain) NSNumber * count9;
@property (nonatomic, retain) NSNumber * count6;
@property (nonatomic, retain) NSNumber * count8;
@property (nonatomic, retain) NSNumber * count3;
@property (nonatomic, retain) NSNumber * count5;
@property (nonatomic, retain) NSNumber * countm;
@property (nonatomic, retain) NSNumber * count4;
@property (nonatomic, retain) NSNumber * count7;
@property (nonatomic, retain) NSNumber * count10;
@property (nonatomic, retain) HisData *hisData;

+ (StaRecord*)insertStaRecord:(User*)user inManagedObjectContext:(NSManagedObjectContext*)context;

@end
