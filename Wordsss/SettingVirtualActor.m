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

@end
