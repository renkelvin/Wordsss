//
//  User.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "User.h"
#import "Defult.h"
#import "MemData.h"
#import "Profile.h"
#import "Status.h"


@implementation User

@dynamic id;
@dynamic password;
@dynamic username;
@dynamic memdata;
@dynamic profile;
@dynamic status;
@dynamic defult;

+ (User*)insertUser:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    User* user = nil;
    
    user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];

    return user;
}

@end
