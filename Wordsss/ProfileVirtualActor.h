//
//  ProfileVirtualActor.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/24/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "User.h"
#import "RKChartView.h"
#import "UserDataManager.h"

@interface ProfileVirtualActor : NSObject
{
    //
    User* _user;
    
}

@property (nonatomic, retain) User* user;

#pragma mark - Class method

+ (ProfileVirtualActor*)profileVirtualActor;

#pragma mark - Instance method

- (void)prepare;

- (NSDictionary*)getChartPoints;

@end
