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

+ (UserVirtualActor*)userVirtualActor
{
    if (!sharedUserVirtualActor) {
        sharedUserVirtualActor = [[UserVirtualActor alloc] init];
        
        [sharedUserVirtualActor prepare];
    }
    
    return sharedUserVirtualActor;
}

- (void)prepare
{
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

@end
