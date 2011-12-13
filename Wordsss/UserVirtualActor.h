//
//  UserVirtualActor.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserDataManager.h"

#import "User.h"
#import "Defult.h"
#import "Status.h"
#import "WordRecord.h"

@interface UserVirtualActor : NSObject
{
    //
    User* _user;
    NSMutableArray* _wordRecordArray;
    
    //
    WordRecord* _wordRecordCur;
}

#pragma mark - Property

@property (nonatomic, retain) WordRecord* wordRecordCur;

#pragma mark - Class method

+ (UserVirtualActor*)userVirtualActor;

#pragma mark - Instance method

- (void)prepare;

- (void)updateWordRecordCur;
- (void)setWordRecordCurLevelInc;
- (void)setWordRecordCurLevelDec;

@end
