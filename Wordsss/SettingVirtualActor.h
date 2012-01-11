//
//  SettingVirtualActor.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/24/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"
#import "UserDataManager.h"

@interface SettingVirtualActor : NSObject
{
    //
    User* _user;    
}

@property (nonatomic, retain) User* user;

+ (SettingVirtualActor*)settingVirtualActor;

@end
