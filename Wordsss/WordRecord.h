//
//  WordRecord.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/22/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "Word.h"
#import "User.h"
#import "Status.h"
#import "MemData.h"

@class MemData;

@interface WordRecord : NSManagedObject

@property (nonatomic, retain) NSNumber * day;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSNumber * word_id;
@property (nonatomic, retain) NSNumber * dlc;
@property (nonatomic, retain) NSNumber * dls;
@property (nonatomic, retain) MemData *memdata;

+ (WordRecord*)insertWordRecord:(Word*)word user:(User*)user inManagedObjectContext:(NSManagedObjectContext*)context;

- (void)prepare:(User*)user;

- (void)levelInc;
- (void)levelDec;

- (void)dlInc;
- (void)dlDec;

- (void)cleardl;

- (void)nextDay;

@end
