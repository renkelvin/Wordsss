//
//  Defult.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Defult;

@interface Defult : NSManagedObject

@property (nonatomic, retain) NSNumber * todayWordLimit;
@property (nonatomic, retain) Defult *user;

@end
