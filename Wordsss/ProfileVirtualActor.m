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

- (NSArray*)getStaRecords
{
    // Get UserDataManager
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // Get StaRecords
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"StaRecord"];
    [request setSortDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"day" ascending:YES]]];
    NSArray* srArray = [udm.managedObjectContext executeFetchRequest:request error:nil];
    
    return srArray;
}

- (int)getVocaCurrent
{
    return [_user.defult vocaCurrent];
}

- (int)getVocaNow
{
    int vocaNow = [_user.defult vocaCurrent] + 2 * (int)[_user.status getCount];
    
    return vocaNow;
}

- (int)getVocaTarget
{
    return [_user.defult vocaTarget];
}

@end
