//
//  User.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/22/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "User.h"
#import "Defult.h"
#import "HisData.h"
#import "MemData.h"
#import "Profile.h"
#import "Status.h"


@implementation User

@dynamic id;
@dynamic password;
@dynamic username;
@dynamic defult;
@dynamic memdata;
@dynamic profile;
@dynamic status;
@dynamic hisdata;

+ (User*)insertUser:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    User* user = nil;
    
    user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    
    return user;
}

- (void)nextDay
{
    self.status.day = [NSNumber numberWithInt:([self.status.day intValue] + 1)];
}

@end
