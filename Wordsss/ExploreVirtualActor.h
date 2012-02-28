//
//  ExploreVirtualActor.h
//  Wordsss
//
//  Created by Ren Chuan on 12/30/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UserDataManager.h"
#import "WordsssDBDataManager.h"

#import "SearchHis.h"

@interface ExploreVirtualActor : NSObject
{
    //
    NSArray* _associationArray;
    NSArray* _rootaffixArray;
    NSArray* _senseArray;
    
    //
    NSArray* _searchHisArray;
}

+ (ExploreVirtualActor*)exploreVirtualActor;

- (void)prepare;

- (NSArray*)getAssociation;
- (NSArray*)getRootaffix;
- (NSArray*)getSense;

- (NSArray*)getSearchHis;
- (NSArray*)getSearchHisWordID;

- (void)updateSearchHis;

@end
