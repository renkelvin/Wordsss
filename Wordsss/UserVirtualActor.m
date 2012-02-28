//
//  UserVirtualActor.m
//  Wordsss
//
//  Created by Ren Chuan on 1/17/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "UserVirtualActor.h"

static UserVirtualActor* sharedUserVirtualActor = nil;

@implementation UserVirtualActor

@synthesize user = _user;

+ (UserVirtualActor*)userVirtualActor
{
    if (!sharedUserVirtualActor) {
        sharedUserVirtualActor = [[UserVirtualActor alloc] init];
        
        [sharedUserVirtualActor prepare];
    }
    
    return sharedUserVirtualActor;
}

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

- (void)prepare
{
    // Get user
    [self updateUser];

    //
    UserDataManager* udm = [UserDataManager userdataManager];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"WordRecord"];
    NSArray* wordRecordArray = [udm.managedObjectContext executeFetchRequest:request error:nil];
    
    _wordRecordDict = [NSMutableDictionary dictionary];
    for (WordRecord* wr in wordRecordArray) {
        [_wordRecordDict setObject:wr forKey:wr.word_id];
    }
}

- (WordRecord*)getWordRecord:(Word*)word
{
    WordRecord* wr = nil;
    
    wr = [_wordRecordDict objectForKey:word.id];
    
    return wr;
}

- (WordRecord*)createWordRecord:(Word*)word forUser:(User*)user
{
    UserDataManager* udm = [UserDataManager userdataManager];
    WordRecord* wr = [udm createWordRecord:word forUser:user];
    
    [_wordRecordDict setObject:wr forKey:wr.word_id];
    
    return wr;
}

- (SearchHis*)createSearchHis:(Word*)word
{
    UserDataManager* udm = [UserDataManager userdataManager];
    SearchHis* sh = [udm createSearchHis:word forUser:_user];
    
    return sh;
}

@end
