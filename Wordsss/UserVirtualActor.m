//
//  UserVirtualActor.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/12/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "UserVirtualActor.h"

static UserVirtualActor* sharedUserVirtualActor = nil;

@implementation UserVirtualActor

@synthesize user = _user;

@synthesize wordRecordPre = _wordRecordPre;
@synthesize wordRecordCur = _wordRecordCur;
@synthesize wordRecordPos = _wordRecordPos;

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

+ (UserVirtualActor*)userVirtualActor
{
    if (!sharedUserVirtualActor) {
        sharedUserVirtualActor = [[UserVirtualActor alloc] init];
        [sharedUserVirtualActor prepare];
    }
    
    return sharedUserVirtualActor;
}

#pragma mark -

- (void)updateUser
{
    // Get UserDataManager
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // Get user
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    _user = [[udm.managedObjectContext executeFetchRequest:request error:nil] lastObject];
    
    if (!_user) {
        _user = [udm createUser];
    }
}

- (void)updateWordRecordSet
{
    // Get UserDataManager
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // Get wordRecordSet
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"WordRecord"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"day == %d", [_user.status.day intValue]]];
    _wordRecordSet = [NSMutableSet setWithArray:[udm.managedObjectContext executeFetchRequest:request error:nil]];    
    
    // Init enumerator
    _wordRecordSetEnumerator = [_wordRecordSet objectEnumerator];
    
    NSLog(@"updataWordRecordSet: %d", [_wordRecordSet count]);
}

- (void)fillWordRecordSet
{
    // Enough
    if ([_wordRecordSet count] >= [_user.defult.todayWordLimit intValue])
        return;
    
    // NOT Enough
    // Get existing wordRecord
    NSMutableSet* word_id_set = [NSMutableArray array];
    for (WordRecord* wr in _wordRecordSet) {
        [word_id_set addObject:wr.word_id];
    }
    
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    
    // Get new word
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Word"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"NOT (id in %@)", word_id_set]];
    NSSet* new_word_set = [NSMutableSet setWithArray:[wdm.managedObjectContext executeFetchRequest:request error:nil]];
    
    NSLog(@"fillWordRecordSet: %d", [new_word_set count]);
    
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // Set new wordRecord
    for (Word* w in new_word_set) {
        WordRecord* wr = [udm createWordRecord:w forUser:_user];
        [wr prepare];
        [_wordRecordSet addObject:wr];
        
        if ([_wordRecordSet count] >= [_user.defult.todayWordLimit intValue])
            return;
    }
}

- (void)updateWordRecord
{
    _wordRecordPos = _wordRecordCur;
    _wordRecordCur = _wordRecordPre;
    
    _wordRecordPre = (WordRecord*)([_wordRecordSetEnumerator nextObject]);
}

- (void)prepare
{
    // Get user
    [self updateUser];
    
    // Get wordRecordArray
    [self updateWordRecordSet];
    
    // More wordRecordArray
    [self fillWordRecordSet];
    
    // Get WordRecord
    [self updateWordRecord];
}

- (void)nextDay
{
    // Day++
    [_user nextDay];
    
    // WordRecord++ & store HisRecord
    UserDataManager* udm = [UserDataManager userdataManager];
    for (WordRecord* wr in _wordRecordSet) {
        [udm createHisRecord:wr forUser:_user];
        [wr nextDay];
        [wr cleardl];
    }
    
    // Get user
    [self updateUser];
    
    // Get wordRecordArray
    [self updateWordRecordSet];
    
    // More wordRecordArray
    [self fillWordRecordSet];
    
    // Get WordRecord
    [self updateWordRecord];
}

- (BOOL)checkWordRecord:(WordRecord*)wordRecord
{
    if ([wordRecord.dls intValue] >= 3) {
        return YES;
    }
    if ([wordRecord.dlc intValue] >= 7) {
        return YES;
    }
    
    return NO;
}

- (void)dropWordRecord:(WordRecord*)wordRecord
{
    [_wordRecordSet removeObject:wordRecord];
}

- (void)setWordRecordCurLevelInc
{
    [_wordRecordCur levelInc];
    [_wordRecordCur dlInc];
    
    //
    if ([self checkWordRecord:_wordRecordCur]) {
        [_wordRecordCur cleardl];
        [self dropWordRecord:_wordRecordCur];
    }
    
    NSLog(@"WordRecordCur: day-%d level-%d dls-%d dlc-%d", [_wordRecordCur.day intValue], [_wordRecordCur.level intValue], [_wordRecordCur.dls intValue], [_wordRecordCur.dlc intValue]);
    NSLog(@"Set count: %d", [_wordRecordSet count]);
}

- (void)setWordRecordCurLevelDec
{
    [_wordRecordCur levelDec];
    [_wordRecordCur dlDec];

    //
    if ([self checkWordRecord:_wordRecordCur]) {
        [_wordRecordCur cleardl];
        [self dropWordRecord:_wordRecordCur];
    }
    
    NSLog(@"WordRecordCur: day-%d level-%d dls-%d dlc-%d", [_wordRecordCur.day intValue], [_wordRecordCur.level intValue], [_wordRecordCur.dls intValue], [_wordRecordCur.dlc intValue]);
    NSLog(@"Set count: %d", [_wordRecordSet count]);
}

@end
