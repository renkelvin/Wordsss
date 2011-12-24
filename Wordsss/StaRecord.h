//
//  StaRecord.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/24/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class HisData;

@interface StaRecord : NSManagedObject

@property (nonatomic, retain) NSNumber * day;
@property (nonatomic, retain) NSNumber * date;
@property (nonatomic, retain) NSNumber * dlc;
@property (nonatomic, retain) HisData *hisData;

@end
