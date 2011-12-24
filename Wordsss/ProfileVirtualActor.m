//
//  ProfileVirtualActor.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/24/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "ProfileVirtualActor.h"

static ProfileVirtualActor* sharedProfileVirtualActor = nil;

@implementation ProfileVirtualActor

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

+ (ProfileVirtualActor*)profileVirtualActor
{
    if (!sharedProfileVirtualActor) {
        sharedProfileVirtualActor = [[ProfileVirtualActor alloc] init];
        [sharedProfileVirtualActor prepare];
    }
    
    return sharedProfileVirtualActor;
}

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

- (void)prepare
{
    // Get user
    [self updateUser];
}

@end
