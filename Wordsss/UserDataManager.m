//
//  UserDataManager.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-2.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "UserDataManager.h"

static UserDataManager* sharedUserDataManager;

@implementation UserDataManager

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (UserDataManager*)userdataManager
{
    if (!sharedUserDataManager) {
        sharedUserDataManager = [[UserDataManager alloc] init];
    }
    
    return sharedUserDataManager;
}

@end
