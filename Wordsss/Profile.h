//
//  Profile.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class User;

@interface Profile : NSManagedObject

@property (nonatomic, retain) NSString * nickname;
@property (nonatomic, retain) User *user;

@end
