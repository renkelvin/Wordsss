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
        
        [sharedExploreVirtualActor prepare];
    }
    
    return sharedExploreVirtualActor;
}

- (void)updateAssociation
{
    NSMutableArray* array = [NSMutableArray array];
    
    // Get wdm
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    NSArray* fetchResult = [wdm getRandomAssociations:5];
    
    // Add WordAssociation
    for (Association* association in fetchResult) {
        if ([association.word_association count]) {
            [array addObject:[association.word_association anyObject]];
        }
    }
    
    // Set
    _associationArray = array;
}

- (void)updateRootaffix
{
    NSMutableArray* array = [NSMutableArray array];
    
    // Get wdm
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    NSArray* fetchResult = [wdm getRandomRootaffixs:1];
    
    // Add Rootaffix
    [array addObject:[fetchResult lastObject]];
    
    // Add WordRootaffix
    for (Rootaffix* rootaffix in fetchResult) {
        if ([rootaffix.word_rootaffix count]) {
            [array addObjectsFromArray:[rootaffix.word_rootaffix allObjects]];
        }
    }
    
    // Set
    _rootaffixArray = array;
}

- (void)updateSense
{
    NSMutableArray* array = [NSMutableArray array];
    
    // Get wdm
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    NSArray* fetchResult = [wdm getRandomSenses:1];
    
    // Add Sense
    [array addObject:[fetchResult lastObject]];
    
    // Add WordSense
    for (Sense* sense in fetchResult) {
        if ([sense.word_sense count]) {
            [array addObjectsFromArray:[sense.word_sense allObjects]];
        }
    }
    
    // Set
    _senseArray = array;
}

- (void)updateSearchHis
{
    // Get wdm
    UserDataManager* udm = [UserDataManager userdataManager];
    NSArray* fetchResult = [udm getSearchHis];
        
    // Set
    _searchHisArray = fetchResult;
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

- (NSArray*)getSearchHis
{
    if (!_searchHisArray) {
        [self updateSearchHis];
    }
    
    return _searchHisArray;
}

- (NSArray*)getSearchHisWordID
{
    NSMutableArray* array = [NSMutableArray array];
    
    for (SearchHis* his in _searchHisArray) {
        NSNumber* word_id = his.word_id;
        [array addObject:word_id];
    }
    
    return array;
}

- (void)prepare
{
    [self updateSearchHis];
}

@end
