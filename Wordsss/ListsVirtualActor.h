//
//  ListsVirtualActor.h
//  Wordsss
//
//  Created by Ren Chuan on 1/14/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserDataManager.h"
#import "WordsssDBDataManager.h"

#import "CSListWord.h"

@interface ListsVirtualActor : NSObject
{
    NSArray* _listArray;
}

+ (ListsVirtualActor*)listsVirtualActor;

- (void)prepare;

- (NSArray*)getListArray;

@end
