//
//  AhdDictWord.m
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "AhdDictWord.h"

@implementation AhdDictWord

@dynamic id;
@dynamic type;
@dynamic meaning;
@dynamic word_dict;

#pragma mark -

- (NSString*)getTypeString
{
    switch ([self.type intValue]) {
        case 0:
            return @"oth.";
            break;
        case 1:
            return @"n.";
            break;
        case 2:
            return @"v.";
            break;
        case 3:
            return @"adj.";
            break;
        case 4:
            return @"adv.";
            break;
        case 5:
            return @"prep.";
            break;
        case 6:
            return @"conj.";
            break;
        case 7:
            return @"vt.";
            break;
        case 8:
            return @"vi.";
            break;
        case 9:
            return @"oth.";
            break;
        default:
        {
            // 组合词性
            return @".";
            
            break;
        }
    }
}

- (NSString*)getFullTypeString
{
    switch ([self.type intValue]) {
        case 0:
            return @"others";
            break;
        case 1:
            return @"noun";
            break;
        case 2:
            return @"verb";
            break;
        case 3:
            return @"adjective";
            break;
        case 4:
            return @"adverb";
            break;
        case 5:
            return @"preposition";
            break;
        case 6:
            return @"conjunction";
            break;
        case 7:
            return @"transitive verb";
            break;
        case 8:
            return @"intransitive verb";
            break;
        case 9:
            return @"others";
            break;
        default:
        {
            // 组合词性
            return @".";
            
            break;
        }
    }
}

- (NSString*)getShortTypeString
{
    switch ([self.type intValue]) {
        case 0:
            return @"oth.";
            break;
        case 1:
            return @"n.";
            break;
        case 2:
            return @"v.";
            break;
        case 3:
            return @"adj.";
            break;
        case 4:
            return @"adv.";
            break;
        case 5:
            return @"prep.";
            break;
        case 6:
            return @"conj.";
            break;
        case 7:
            return @"vt.";
            break;
        case 8:
            return @"vi.";
            break;
        case 9:
            return @"oth.";
            break;
        default:
        {
            // 组合词性
            return @".";
            
            break;
        }
    }
}

- (NSString*)getTypeStringWithBlank
{
    switch ([self.type intValue]) {
        case 0:
            return @"  oth.";
            break;
        case 1:
            return @"     n.";
            break;
        case 2:
            return @"     v.";
            break;
        case 3:
            return @"  adj.";
            break;
        case 4:
            return @"  adv.";
            break;
        case 5:
            return @"prep.";
            break;
        case 6:
            return @"conj.";
            break;
        case 7:
            return @"    vt.";
            break;
        case 8:
            return @"    vi.";
            break;
        case 9:
            return @"      oth.";
            break;
        default:
        {
            // 组合词性
            return @"        .";
            
            break;
        }
    }
}

- (NSString*)getBriefMeaning
{
    NSString* string = [NSString stringWithFormat:@""];
    
    int i = 0;
    for (AhdDictMeaning* ahdDictMeaning in self.meaning) {
        if (i == 0) {
            string = [string stringByAppendingFormat:@"%@ %@\n", [self getTypeStringWithBlank], [ahdDictMeaning getShortMeaning]];
        } 
        else {
            // string = [string stringByAppendingFormat:@"%@ %@\n", [self getTypeString], [ahdDictMeaning getShortMeaning]];
        }
        i++;
    }
    
    return string;
}

- (NSString*)getSummaryMeaning
{
    NSString* string = [self getTypeString];
    
    int i = 0;
    for (AhdDictMeaning* ahdDictMeaning in self.meaning) {
        if (i == 0) {
            string = [string stringByAppendingFormat:@"%@", [ahdDictMeaning getShortMeaning]];
        } 
        else {
            string = [string stringByAppendingFormat:@"；%@", [ahdDictMeaning getShortMeaning]];
        }
        i++;
    }
    
    return string;
}

- (NSString*)getMeaningCN
{
    NSString* string = [NSString stringWithFormat:@""];
    
    int i = 0;
    for (AhdDictMeaning* ahdDictMeaning in self.meaning) {
        if (i == 0) {
            string = [string stringByAppendingFormat:@"%@", [ahdDictMeaning getShortMeaning]];
        } 
        else {
            string = [string stringByAppendingFormat:@"；%@", [ahdDictMeaning getShortMeaning]];
        }
        i++;
    }
    
    return string;
}

- (NSString*)getFullMeaningCN
{
    NSString* string = [NSString stringWithFormat:@"%@\n", [self getFullTypeString]];
    
    int i = 1;
    for (AhdDictMeaning* ahdDictMeaning in self.meaning) {
        string = [string stringByAppendingFormat:@"%d. %@\n", i, ahdDictMeaning.meaning_cn];
        i++;
    }
    
    return string;
}

- (NSArray*)getSentence
{
    NSMutableArray* array = [NSMutableArray array];
    
    for (AhdDictMeaning* ahdDictMeaning in self.meaning) {
        if (ahdDictMeaning.ahdDictSentence) {
            [array addObject:ahdDictMeaning.ahdDictSentence];
        }
    }
    
    return array;
}

@end
