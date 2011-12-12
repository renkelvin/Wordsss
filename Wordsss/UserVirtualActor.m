//
//  UserVirtualActor.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "UserVirtualActor.h"

static UserVirtualActor* sharedUserVirtualActor = nil;

@implementation UserVirtualActor

@synthesize user = _user;

#pragma mark -

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark -

+ (UserVirtualActor*)userVirtualActor
{
    if (!sharedUserVirtualActor) {
        sharedUserVirtualActor = [[UserVirtualActor alloc] init];
    }
    
    return sharedUserVirtualActor;
}

#pragma mark -

@end
