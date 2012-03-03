//
//  WordsssDBVirtualActor.m
//  Wordsss
//
//  Created by Ren Chuan on 2/28/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "WordsssDBVirtualActor.h"

static WordsssDBVirtualActor* sharedWordsssDBVirtualActor = nil;

@implementation WordsssDBVirtualActor

+ (WordsssDBVirtualActor*)wordsssDBVirtualActor
{
    if (!sharedWordsssDBVirtualActor)
    {
        sharedWordsssDBVirtualActor = [[WordsssDBVirtualActor alloc] init];
        
//        [sharedWordsssDBVirtualActor prepare];
    }
    
    return sharedWordsssDBVirtualActor;
}

- (void)prepare
{
    //
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    
    if (!_wordDict) {
        NSArray* array = [wdm getAllWord];
        _wordDict = [NSMutableDictionary dictionaryWithCapacity:[array count]];
        
        for (Word* word in array) {
            [_wordDict setValue:word forKey:word.name];
        }
        
        _allKeys = [_wordDict allKeys];
    }
}

- (NSArray*)getWordsWithPrefix:(NSString*)prefix
{
    //
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    NSArray* array = [wdm getWordWithPrefix:prefix];
    
//    //
//    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF like %@", [prefix stringByAppendingString:@"*"]];
//    NSArray* keyArray = [_allKeys filteredArrayUsingPredicate:predicate];
//
//    //
//    NSArray* notFoundMarker = [NSArray array];
//    NSArray* array = [_wordDict objectsForKeys:keyArray notFoundMarker:notFoundMarker];
//
//    int count = [array count];
//    if (count > 10) {
//        count = 10;
//        array = [array subarrayWithRange:NSMakeRange(0, count)];
//    }
    
    return array;
}

@end
