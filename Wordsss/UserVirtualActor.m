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

@synthesize wordRecordCur = _wordRecordCur;

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

- (void)updateWordRecordArray
{
    // Get UserDataManager
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // Get wordRecordArray
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"WordRecord"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"day == %d", [_user.status.day intValue]]];
    _wordRecordArray = [NSMutableArray arrayWithArray:[udm.managedObjectContext executeFetchRequest:request error:nil]];    
}

- (void)fillWordRecordArray
{
    // Enough
    if ([_wordRecordArray count] >= [_user.defult.todayWordLimit intValue])
        return;
    
    // NOT Enough
    // Get existing wordRecord
    NSMutableArray* word_id_array = [NSMutableArray array];
    for (WordRecord* wr in _wordRecordArray) {
        [word_id_array addObject:wr.word_id];
    }
    
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    
    // Get new word
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"Word"];
    [request setPredicate:[NSPredicate predicateWithFormat:@"NOT (id in %@)", word_id_array]];
    NSArray* new_word_array = [NSMutableArray arrayWithArray:[wdm.managedObjectContext executeFetchRequest:request error:nil]];
    
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // Set new wordRecord
    for (Word* w in new_word_array) {
        WordRecord* wr = [udm createWordRecord:w forUser:_user];
        [_wordRecordArray addObject:wr];
        
        if ([_wordRecordArray count] >= [_user.defult.todayWordLimit intValue])
            return;
    }
    
}

- (void)updateWordRecordCur
{
    if ([_wordRecordArray count] != 0)
    {
        int index = rand() % [_wordRecordArray count];
        _wordRecordCur = [_wordRecordArray objectAtIndex:index];
    }
}

- (void)prepare
{
    // Get user
    [self updateUser];
    
    // Get wordRecordArray
    [self updateWordRecordArray];
    
    // More wordRecordArray
    [self fillWordRecordArray];
    
    // Get WordRecordCur
    [self updateWordRecordCur];
}

- (void)setWordRecordCurLevelInc
{
    [_wordRecordCur levelInc];
}

- (void)setWordRecordCurLevelDec
{
    [_wordRecordCur levelDec];
}

@end
