//
//  Defult.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Defult.h"

@implementation Defult

@dynamic todayWordLimit;
@dynamic user;

+ (Defult*)insertDefult:(NSDictionary*)dict inManagedObjectContext:(NSManagedObjectContext*)context
{
    Defult* defult = nil;
    
    defult = [NSEntityDescription insertNewObjectForEntityForName:@"Defult" inManagedObjectContext:context];
    
    return defult;
}

@end
