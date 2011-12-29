//
//  AhdDictMeaning.m
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "AhdDictMeaning.h"
#import "AhdDictWord.h"


@implementation AhdDictMeaning

@dynamic id;
@dynamic meaning_cn;
@dynamic meaning_en;
@dynamic ahdDictWord;

- (NSString*)getShortMeaning
{
    return [[self.meaning_cn componentsSeparatedByString:@"："] objectAtIndex:0];
}

@end
