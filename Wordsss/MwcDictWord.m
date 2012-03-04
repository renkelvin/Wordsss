//
//  MwcDictWord.m
//  Wordsss
//
//  Created by Ren Chuan on 2/20/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "MwcDictWord.h"
#import "MwcDictMeaning.h"
#import "Word_Dict.h"


@implementation MwcDictWord

@dynamic id;
@dynamic etymology;
@dynamic function;
@dynamic inflectform;
@dynamic date;
@dynamic meaning;
@dynamic word_dict;

- (NSString*)getFunction
{
    NSString* string = self.function;
    
    return string;
}

- (NSString*)getFullMeaningEN
{
    NSString* string = [NSString stringWithFormat:@"%@\n", self.function];
    
    int i = 1;
    for (MwcDictMeaning* mwcDictMeaning in self.meaning) {
        string = [string stringByAppendingFormat:@"%d. %@\n", i, mwcDictMeaning.meaning_en];
        i++;
    }
    
    return string;
}

- (NSString*)getMeaningEN
{
    NSString* string = [NSString stringWithFormat:@""];
    
    int i = 1;
    for (MwcDictMeaning* mwcDictMeaning in self.meaning) {
        string = [string stringByAppendingFormat:@"%d %@\n", i, mwcDictMeaning.meaning_en];
        i++;
    }
    
    return string;
}

@end
