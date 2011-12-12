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
    }
    
    return sharedUserVirtualActor;
}

#pragma mark -

- (void)prepare
{
    // Get UserDataManager
    UserDataManager* udm = [UserDataManager userdataManager];
    
    // Get user
    NSFetchRequest* request = [[NSFetchRequest alloc] initWithEntityName:@"User"];
    _user = [[udm.managedObjectContext executeFetchRequest:request error:nil] lastObject];
    
    // Get wordRecord for today
    NSFetchRequest* request2 = [[NSFetchRequest alloc] initWithEntityName:@"WordRecord"];
    [request2 setPredicate:[NSPredicate predicateWithFormat:@"day == %d", [_user.status.day intValue]]];
    _wordRecordArray = [NSMutableArray arrayWithArray:[udm.managedObjectContext executeFetchRequest:request2 error:nil]];
    
    // More wordRecord for today
    if (YES) {
        ;
    }
}

- (void)updateWordRecord
{
    
}

- (void)setWordRecordCurLevelInc
{

}

- (void)setWordRecordCurLevelDec
{
    
}

@end
