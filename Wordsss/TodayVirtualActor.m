//
//  TodayVirtualActor.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "TodayVirtualActor.h"

static TodayVirtualActor* sharedTodayVirtualActor = nil;

@implementation TodayVirtualActor

@synthesize wordPre = _wordPre, wordCur = _wordCur, wordPos = _wordPos;

#pragma mark -

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark -

+ (TodayVirtualActor*)todayVirtualActor
{
    if (!sharedTodayVirtualActor) {
        sharedTodayVirtualActor = [[TodayVirtualActor alloc] init];
        [sharedTodayVirtualActor prepare];
    }
    
    return sharedTodayVirtualActor;
}

#pragma mark - 


- (void)updateWord
{
    // Move
    _wordPos = _wordCur;
    _wordCur = _wordPre;
    
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    
    //
    NSNumber* word_id = [uva wordRecordCur].word_id;
    _wordPre = [wdm getWordWithId:word_id];
}

- (void)updateWordWithWordId:(NSNumber*)word_id
{
    // Move
    _wordPos = _wordCur;
    _wordCur = _wordPre;

    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];

    _wordPre = [wdm getWordWithId:word_id];
}

- (void)prepare
{
    //
    _wordPre = _wordCur = _wordPos = nil;
    
    //
    [self updateWord];
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    [uva updateWordRecordCur];
    [self updateWord];
    
}

@end
