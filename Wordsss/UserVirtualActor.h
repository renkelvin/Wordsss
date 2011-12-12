//
//  UserVirtualActor.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserDataManager.h"

@interface UserVirtualActor : NSObject
{
    //
//    User* _user;
}

#pragma mark - property

#pragma mark - Class method

+ (UserVirtualActor*)userVirtualActor;

#pragma mark - Instance method

- (void)prepare;

@end
