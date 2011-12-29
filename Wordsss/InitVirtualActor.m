//
//  InitVirtualActor.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "InitVirtualActor.h"

static InitVirtualActor* sharedInitVirtualActor;

@implementation InitVirtualActor

@synthesize user = _user;

#pragma mark -

- (void)updateUser
{
    // Get UserDataManager
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // Get user
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    _user = [[udm.managedObjectContext executeFetchRequest:request error:nil] lastObject];
    
    if (!_user) {
        _user = [udm createUser];
    }
}

+ (InitVirtualActor*)initVirtualActor
{
    if (!sharedInitVirtualActor) {
        sharedInitVirtualActor = [[InitVirtualActor alloc] init];
        
        [sharedInitVirtualActor updateUser];
    }
    
    return sharedInitVirtualActor;
}

@end
