//
//  UserVirtualActor.h
//  Wordsss
//
//  Created by Ren Chuan on 1/17/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Word.h"
#import "WordRecord.h"

#import "UserDataManager.h"

@interface UserVirtualActor : NSObject
{
    //
    NSMutableDictionary* _wordRecordDict;
}

+ (UserVirtualActor*)userVirtualActor;

- (void)prepare;

- (WordRecord*)getWordRecord:(Word*)word;
- (WordRecord*)createWordRecord:(Word*)word forUser:(User*)user;

@end
