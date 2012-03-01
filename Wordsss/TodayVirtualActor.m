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

@synthesize user = _user;

@synthesize wordPre = _wordPre;
@synthesize wordCur = _wordCur;
@synthesize wordPos = _wordPos;

@synthesize wordRecordPre = _wordRecordPre;
@synthesize wordRecordCur = _wordRecordCur;
@synthesize wordRecordPos = _wordRecordPos;

@synthesize todayWordSum;

@synthesize wordRecordSet = _wordRecordSet;

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
    
    if ([sharedTodayVirtualActor checkNextDayByTime]) {
        [sharedTodayVirtualActor nextDay];
    }
    
    return sharedTodayVirtualActor;
}

#pragma mark - 

- (void)updateWord
{
    // Move
    _wordPos = _wordCur;
    _wordCur = _wordPre;
    
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    
    //
    if (_wordRecordPre) {
        NSNumber* word_id = _wordRecordPre.word_id;
        _wordPre = [wdm getWordWithId:word_id];
    }
}

- (void)updateWordRecord
{
    // Move
    _wordRecordPos = _wordRecordCur;
    _wordRecordCur = _wordRecordPre;
    
    //
    _wordRecordPre = nil;
    while ([_wordRecordSet count]) {
        int index = rand() % [_wordRecordSet count];
        _wordRecordPre = (WordRecord*)[[_wordRecordSet allObjects] objectAtIndex:index];
        
        if ([_wordRecordPre.word_id intValue] != [_wordRecordCur.word_id intValue]) {
            break;
        }
    }
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
    
    //
    NSSet* tempSet = nil;
    [request setPredicate:[NSPredicate predicateWithFormat:@"day == %d+0", [_user.status.day intValue]]];
    tempSet = [NSMutableSet setWithArray:[udm.managedObjectContext executeFetchRequest:request error:nil]];    
    NSLog(@"Word record in day %d+0: %d", [_user.status.day intValue], [tempSet count]);
    [request setPredicate:[NSPredicate predicateWithFormat:@"day == %d+1", [_user.status.day intValue]]];
    tempSet = [NSMutableSet setWithArray:[udm.managedObjectContext executeFetchRequest:request error:nil]];    
    NSLog(@"Word record in day %d+1: %d", [_user.status.day intValue], [tempSet count]);
    [request setPredicate:[NSPredicate predicateWithFormat:@"day == %d+2", [_user.status.day intValue]]];
    tempSet = [NSMutableSet setWithArray:[udm.managedObjectContext executeFetchRequest:request error:nil]];    
    NSLog(@"Word record in day %d+2: %d", [_user.status.day intValue], [tempSet count]);
    [request setPredicate:[NSPredicate predicateWithFormat:@"day == %d+3", [_user.status.day intValue]]];
    tempSet = [NSMutableSet setWithArray:[udm.managedObjectContext executeFetchRequest:request error:nil]];    
    NSLog(@"Word record in day %d+3: %d", [_user.status.day intValue], [tempSet count]);
    [request setPredicate:[NSPredicate predicateWithFormat:@"day == %d+4", [_user.status.day intValue]]];
    tempSet = [NSMutableSet setWithArray:[udm.managedObjectContext executeFetchRequest:request error:nil]];    
    NSLog(@"Word record in day %d+4: %d", [_user.status.day intValue], [tempSet count]);
    [request setPredicate:[NSPredicate predicateWithFormat:@"day == %d+5", [_user.status.day intValue]]];
    tempSet = [NSMutableSet setWithArray:[udm.managedObjectContext executeFetchRequest:request error:nil]];    
    NSLog(@"Word record in day %d+5: %d", [_user.status.day intValue], [tempSet count]);
    
    NSLog(@"updataWordRecordSet: %d", [_wordRecordSet count]);
}

- (void)fillWordRecordSetFromWordRecord
{
    // Enough
    if ([_wordRecordSet count] >= kTodayWordLimit)
        return;
    
    // Get UserDataManager
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // NOT Enough
    // Get new wordRecord
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"WordRecord"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"day == 0"]];
    NSArray* new_wordRecord_array = [udm.managedObjectContext executeFetchRequest:request error:nil]; 
    
    // Set new wordRecord
    for (WordRecord* wr in new_wordRecord_array) {
        // Set
        [wr prepare:_user];
        
        // Add
        [_wordRecordSet addObject:wr];
        
        if ([_wordRecordSet count] >= kTodayWordLimit)
        {    
            NSLog(@"fillWordRecordSetFromWordRecord!");
            return;
        }
    }
    
    NSLog(@"fillWordRecordSetFromWordRecord: %d", [_wordRecordSet count]);
}

- (void)fillWordRecordSetFromWord
{
    // Enough
    if ([_wordRecordSet count] >= kTodayWordLimit)
        return;
    
    // NOT Enough
    // Get existing wordRecord
    NSMutableSet* word_id_set = [NSMutableArray array];
    for (WordRecord* wr in _wordRecordSet) {
        [word_id_set addObject:wr.word_id];
    }
    // Get frequency range
    int freqCur = [_user.defult freqCurrent];
    int freqTar = [_user.defult freqTarget];
    
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    
    // Get new word
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Word"];
    // NSString* pred_1 = [NSString stringWithFormat:@"(NOT (word_dict == nil))"];                // 有意思
    // NSString* pred_2 = [NSString stringWithFormat:@"(NOT (id in %@))", word_id_set];            // 非已有
    // NSString* pred_3 = [NSString stringWithFormat:@"(%d >= frequency.frequency AND frequency.frequency >= %d)", max, min];      // 够难度
    [request setPredicate:[NSPredicate predicateWithFormat:@"(NOT (word_dict == nil)) AND (NOT (id in %@)) AND (%d > frequency.freq AND frequency.freq >= %d)", word_id_set, freqCur, freqTar]];
    NSSet* new_word_set = [NSMutableSet setWithArray:[wdm.managedObjectContext executeFetchRequest:request error:nil]];
    
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    // Set new wordRecord
    for (Word* w in new_word_set) {
        // Get
        WordRecord* wr = [uva createWordRecord:w forUser:_user];
        
        // Set
        [wr prepare:_user];
        
        // Add
        [_wordRecordSet addObject:wr];
        
        if ([_wordRecordSet count] >= kTodayWordLimit)
        {
            NSLog(@"fillWordRecordSetFromWord!");
            return;
        }
    }
    
    NSLog(@"fillWordRecordSetFromWord: %d", [_wordRecordSet count]);
}

- (void)updateTestWordRecord
{
    // Get new word
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Word"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"name == \"pregnant\""]];
    
    NSSet* new_word_set = [NSMutableSet setWithArray:[wdm.managedObjectContext executeFetchRequest:request error:nil]];
    
    _wordRecordSet = [NSMutableSet set];  
    
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    // Set new wordRecord
    for (Word* w in new_word_set) {
        // Get
        WordRecord* wr = [uva createWordRecord:w forUser:_user];
        
        // Set
        [wr prepare:_user];
        
        // Add
        [_wordRecordSet addObject:wr];
    }
}

- (void)prepare
{
    // Init
    _wordPre = _wordCur = _wordPos = nil;
    _wordRecordPre = _wordRecordCur = _wordRecordPos = nil;
    
    // Get user
    [self updateUser];
    
    // Get wordRecordArray
    [self updateWordRecordSet];
    // [self updateTestWordRecord];
    
    // First time launch
    if ([_wordRecordSet count] == 0) {
        // More wordRecordArray
        [self fillWordRecordSetFromWordRecord];
        [self fillWordRecordSetFromWord];
    }
    
    // Get WordRecord Word
    [self updateWordRecord];
    [self updateWord];
    [self updateWordRecord];
    [self updateWord];
    [self updateWordRecord];
    [self updateWord];
    
    //
    self.todayWordSum = [NSNumber numberWithInt:[_wordRecordSet count]];
}

//
- (BOOL)checkNextDayByTime
{
    if (!_user.status.date) {
        return NO;
    }
    
    float deltaTime = [[NSDate date] timeIntervalSinceDate:_user.status.date];
    
    if ([_wordRecordSet count] >= 120) {
        return NO;  
    }
    
    if (deltaTime > 3 * 60 * 60) {
        return YES;
    }
    
    return NO;
}

//
- (BOOL)checkNextDayByCount
{
    // float memDegree = [_user.defult.memDegree floatValue];
    
    //
    // int wordRemainLimit = kTodayWordLimit * ((1-memDegree)*kWordRemainFactorMin + memDegree*kWordRemainFactorMax);
    int wordRemainLimit = 20;
    if ([_wordRecordSet count] <= wordRemainLimit) {
        NSLog(@"wordRemain: %d", [_wordRecordSet count]);
        return YES;
    }
    
    //
    // int totalViewLimit = kTodayWordLimit * ((1-memDegree)*kTotalViewFactorMin + memDegree*kTotalViewFactorMax);
    int totalViewLimit = 300;
    if ([_user.status.dlc intValue] >= totalViewLimit) {
        NSLog(@"viewCount: %d", [_user.status.dlc intValue]);
        return YES;
    }
    
    return NO;
}

- (void)nextDay
{
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // WordRecord++ & store HisRecord
    for (WordRecord* wr in _wordRecordSet) {
        //
        [wr levelUpdate];
        //
        [udm createHisRecord:wr forUser:_user];
        //
        [wr nextDay];
        [wr cleardl];
    }
    
    // Day++
    [udm createStaRecord:_user];
    
    [_user nextDay];
    [_user cleardl];
    
    // Get user
    [self updateUser];
    
    // Get wordRecordArray
    [self updateWordRecordSet];
    
    // More wordRecordArray
    [self fillWordRecordSetFromWordRecord];
    // Even more wordRecordArray
    [self fillWordRecordSetFromWord];
    
    //
    self.todayWordSum = [NSNumber numberWithInt:[_wordRecordSet count]];
}

- (BOOL)checkWordRecord:(WordRecord*)wordRecord
{
    if ([wordRecord.dls intValue] >= 0) {
        return YES;
    }
    if ([wordRecord.dlc intValue] >= 5) {
        return YES;
    }
    
    return NO;
}

- (void)dropWordRecord:(WordRecord*)wordRecord
{
    UserDataManager* udm = [UserDataManager userdataManager];
    
    [wordRecord levelUpdate];
    
    //
    [udm createHisRecord:wordRecord forUser:_user];
    
    //
    [wordRecord nextDay];
    [wordRecord cleardl];
    
    //
    if (wordRecord) {
        [_wordRecordSet removeObject:wordRecord];
    }
}

- (void)setWordRecordCurLevelInc
{
    [_user dlInc];
    [_wordRecordCur dlInc];
    
    //
    if ([self checkWordRecord:_wordRecordCur]) {
        [self dropWordRecord:_wordRecordCur];
    }
    
    //
    if ([self checkNextDayByCount]) {
        [self nextDay];
    }
}

- (void)setWordRecordCurLevelDec
{
    [_user dlInc];
    [_wordRecordCur dlDec];
    
    //
    if ([self checkWordRecord:_wordRecordCur]) {
        [self dropWordRecord:_wordRecordCur];
    }
    
    //
    if ([self checkNextDayByCount]) {
        [self nextDay];
    }
}

@end
