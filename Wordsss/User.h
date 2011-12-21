//
//  User.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/22/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Defult, HisData, MemData, Profile, Status;

@interface User : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) Defult *defult;
@property (nonatomic, retain) MemData *memdata;
@property (nonatomic, retain) Profile *profile;
@property (nonatomic, retain) Status *status;
@property (nonatomic, retain) HisData *hisdata;

+ (User*)insertUser:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context;

@end
