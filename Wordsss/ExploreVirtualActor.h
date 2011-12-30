//
//  ExploreVirtualActor.h
//  Wordsss
//
//  Created by Ren Chuan on 12/30/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WordsssDBDataManager.h"

@interface ExploreVirtualActor : NSObject
{
    //
    NSArray* _associationArray;
    NSArray* _rootaffixArray;
    NSArray* _senseArray;
}

+ (ExploreVirtualActor*)exploreVirtualActor;

- (NSArray*)getAssociation;
- (NSArray*)getRootaffix;
- (NSArray*)getSense;

@end
