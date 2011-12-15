//
//  Status.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Status.h"
#import "User.h"


@implementation Status

@dynamic day;
@dynamic user;

+ (Status*)insertStatus:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    Status* status = nil;
    
    status = [NSEntityDescription insertNewObjectForEntityForName:@"Status" inManagedObjectContext:context];
    
    return status;
}

@end
