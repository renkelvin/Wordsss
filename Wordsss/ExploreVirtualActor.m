//
//  ExploreVirtualActor.m
//  Wordsss
//
//  Created by Ren Chuan on 12/30/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "ExploreVirtualActor.h"

static ExploreVirtualActor* sharedExploreVirtualActor;

@implementation ExploreVirtualActor

+ (ExploreVirtualActor*)exploreVirtualActor
{
    if (!sharedExploreVirtualActor) {
        sharedExploreVirtualActor = [[ExploreVirtualActor alloc] init];
    }
    
    return sharedExploreVirtualActor;
}

- (void)updateAssociation
{
    NSMutableArray* array = [NSArray array];
    
    // Get wdm
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    NSArray* fetchResult = [wdm getRandomAssociations:5];
    
    // Add WordAssociation
    for (Association* association in fetchResult) {
        [array addObject:[association.word_association anyObject]];
    }
    
    // Set
    _associationArray = array;
}

- (void)updateRootaffix
{
    NSMutableArray* array = [NSArray array];
    
    // Get wdm
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    NSArray* fetchResult = [wdm getRandomRootaffixs:1];
    
    // Add Rootaffix
    [array addObject:[fetchResult lastObject]];
    
    // Add WordRootaffix
    for (Association* association in fetchResult) {
        [array addObject:[association.word_association anyObject]];
    }
    
    // Set
    _rootaffixArray = array;
}

- (void)updateSense
{
    NSMutableArray* array = [NSArray array];
    
    // Get wdm
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    NSArray* fetchResult = [wdm getRandomSenses:1];
    
    // Add Sense
    [array addObject:[fetchResult lastObject]];
    
    // Add WordSense
    for (Association* association in fetchResult) {
        [array addObject:[association.word_association anyObject]];
    }
    
    // Set
    _senseArray = array;
}

// 返回 若干WordAssociation
- (NSArray*)getAssociation
{
    if (!_associationArray) {
        [self updateAssociation];
    }
    
    return _associationArray;
}

// 返回 1个Rootaffix 和 若干WordRootaffix
- (NSArray*)getRootaffix
{
    if (!_rootaffixArray) {
        [self updateRootaffix];
    }
    
    return _rootaffixArray;
}

// 返回 1个Sense 和 若干WordSense
- (NSArray*)getSense
{
    if (!_senseArray) {
        [self updateSense];
    }
    
    return _senseArray;
}

@end
