//
//  SettingVirtualActor.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/24/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "SettingVirtualActor.h"

static SettingVirtualActor* sharedSettingVirtualActor = nil;

@implementation SettingVirtualActor

@synthesize user = _user;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (SettingVirtualActor*)settingVirtualActor
{
    if (!sharedSettingVirtualActor) {
        sharedSettingVirtualActor = [[SettingVirtualActor alloc] init];
    }
    
    return sharedSettingVirtualActor;
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
