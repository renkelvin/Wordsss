//
//  WordsssDBVirtualActor.h
//  Wordsss
//
//  Created by Ren Chuan on 2/28/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WordsssDBDataManager.h"

#import "PureWord.h"

@interface WordsssDBVirtualActor : NSObject
{
    //
    NSArray* _allKeys;
    NSMutableDictionary* _wordDict;
    
    //
    NSArray* _allPureWords;
}

+ (WordsssDBVirtualActor*)wordsssDBVirtualActor;

- (NSArray*)getWordsWithPrefix:(NSString*)prefix;

@end
