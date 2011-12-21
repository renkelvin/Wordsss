//
//  HisRecord.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/22/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface HisRecord : NSManagedObject

@property (nonatomic, retain) NSNumber * word_id;
@property (nonatomic, retain) NSNumber * day;
@property (nonatomic, retain) NSNumber * level;
@property (nonatomic, retain) NSManagedObject *hisData;

@end
