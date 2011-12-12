//
//  WordRecord.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Metadata;

@interface WordRecord : NSManagedObject

@property (nonatomic, retain) NSNumber * day;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSNumber * word_id;
@property (nonatomic, retain) Metadata *matadata;

@end
