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
        
        [sharedWordsssDBVirtualActor prepare];
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
    NSString* strSta = [prefix stringByAppendingFormat:@"a"];
    NSString* strEnd = [prefix stringByAppendingFormat:@"z"];
    __block int a = 0, b = 0;
    [_allKeys enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger inx, BOOL* stop)
     {
         if ([obj compare:strSta] == NSOrderedSame || [obj compare:strSta] == NSOrderedAscending) {
             a = inx;
         }
         
         if ([obj compare:strEnd] == NSOrderedAscending) {
             b = inx;
         }
     }];
    
    NSArray* array = [_allKeys subarrayWithRange:NSMakeRange(a, b - a)];
    
    return array;
}

- (NSArray*)getPureWordsWithPrefix:(NSString*)prefix
{
    NSString* strSta = [prefix stringByAppendingFormat:@"a"];
    NSString* strEnd = [prefix stringByAppendingFormat:@"z"];
    
    __block int a = 0, b = 0;
    [_allKeys enumerateObjectsUsingBlock:^(NSString* obj, NSUInteger inx, BOOL* stop)
     {
         if ([obj compare:strSta] == NSOrderedSame || [obj compare:strSta] == NSOrderedAscending) {
             a = inx;
         }
         
         if ([obj compare:strEnd] == NSOrderedAscending) {
             b = inx;
         }
     }];
    
    NSArray* array = [_allKeys subarrayWithRange:NSMakeRange(a, b - a)];
    
    return array;
}


@end
