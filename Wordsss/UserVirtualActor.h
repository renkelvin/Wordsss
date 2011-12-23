//
//  UserVirtualActor.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserDataManager.h"
#import "WordsssDBDataManager.h"

#import "Word.h"
#import "User.h"
#import "Defult.h"
#import "Status.h"
#import "HisRecord.h"
#import "WordRecord.h"

#define kTodayWordLimit       100
#define kTotalViewFactorMin   1.5
#define kTotalViewFactorMax   4.5
#define kWordRemainFactorMin  0.1
#define kWordRemainFactorMax  0.3

@interface UserVirtualActor : NSObject
{
    //
    User* _user;

    NSMutableSet* _wordRecordSet;
        
    //
    WordRecord* _wordRecordPre;
    WordRecord* _wordRecordCur;
    WordRecord* _wordRecordPos;
}

#pragma mark - Property

@property (nonatomic, retain) User* user;

@property (nonatomic, retain) WordRecord* wordRecordPre;
@property (nonatomic, retain) WordRecord* wordRecordCur;
@property (nonatomic, retain) WordRecord* wordRecordPos;

#pragma mark - Class method

+ (UserVirtualActor*)userVirtualActor;

#pragma mark - Instance method

- (void)prepare;

- (void)nextDay;

- (void)updateWordRecord;

- (BOOL)checkNextDayByTime;
- (BOOL)checkNextDayByCount;

- (void)setWordRecordCurLevelInc;
- (void)setWordRecordCurLevelDec;

@end
