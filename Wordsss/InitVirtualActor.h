//
//  InitVirtualActor.h
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"

#import "UserDataManager.h"

@interface InitVirtualActor : NSObject
{
    //
    User* _user;
}

@property (nonatomic, retain) User* user;

+ (InitVirtualActor*)initVirtualActor;

@end
