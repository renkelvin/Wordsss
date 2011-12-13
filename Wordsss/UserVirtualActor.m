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

- (void)getUser
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

- (void)getWordRecordArray
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
    if ([_wordRecordArray count] < [_user.defult.todayWordLimit intValue]) {
        
    }
}

- (void)getWordRecordCur
{
    
}

- (void)prepare
{
    // Get user
    [self getUser];
    
    // Get wordRecordArray
    [self getWordRecordArray];
    
    // More wordRecordArray
    [self fillWordRecordArray];
    
    // Get WordRecordCur
    [self getWordRecordCur];
}

- (void)updateWordRecordCur
{
    
}

- (void)setWordRecordCurLevelInc
{
    
}

- (void)setWordRecordCurLevelDec
{
    
}

@end
