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
    if (!_allPureWords) {
        _allPureWords = [wdm getAllPureWord];
    }
}

- (NSArray*)getWordsWithPrefix:(NSString*)prefix
{
    NSString* strSta = [prefix stringByAppendingFormat:@""];
    NSString* strEnd = [prefix stringByAppendingFormat:@"zzz"];
    __block int a = -1, b = -1;
    [_allPureWords enumerateObjectsUsingBlock:^(PureWord* obj, NSUInteger inx, BOOL* stop)
     {
         if ([obj.name compare:strSta] == NSOrderedSame || [obj.name compare:strSta] == NSOrderedDescending) {
             if (a == -1) {
                 a = (int)inx;
             }
         }
         
         if ([obj.name compare:strEnd] == NSOrderedDescending) {
             b = (int)inx;
             
             *stop = YES;
         }
     }];
    
    NSArray* array = [_allPureWords subarrayWithRange:NSMakeRange(a, b - a)];
    
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
             a = (int)inx;
         }
         
         if ([obj compare:strEnd] == NSOrderedAscending) {
             b = (int)inx;
         }
     }];
    
    NSArray* array = [_allKeys subarrayWithRange:NSMakeRange(a, b - a)];
    
    return array;
}


@end
