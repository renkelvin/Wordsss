//
//  WordsssDBVirtualActor.h
//  Wordsss
//
//  Created by Ren Chuan on 2/28/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WordsssDBDataManager.h"

@interface WordsssDBVirtualActor : NSObject
{
    //
    NSMutableDictionary* _wordDict;
}

+ (WordsssDBVirtualActor*)wordsssDBVirtualActor;

- (NSArray*)getWordsWithPrefix:(NSString*)prefix;

@end
