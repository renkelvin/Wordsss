//
//  AhdDictWord.m
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "AhdDictWord.h"
#import "Word_Dict.h"


@implementation AhdDictWord

@dynamic id;
@dynamic type;
@dynamic meaning;
@dynamic word_dict;

- (NSString*)getFullMeaingCN
{
    NSString* string = [NSString stringWithFormat:@""];
    
    int i = 1;
    for (AhdDictMeaning* ahdDictMeaning in self.meaning) {
        string = [string stringByAppendingFormat:@"%d. %@\n", i, ahdDictMeaning.meaning_cn];
        i++;
    }
    
    return string;
}

- (void)configCell:(MeaningCell*)cell
{
    //
    [cell.typeLabel setText:[self.type stringValue]];
    
    //
    [cell.meaningLabel setText:[self getFullMeaingCN]];
}

@end
