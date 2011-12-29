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

- (void)configCell:(DictWordCell*)cell
{
    //
    [cell.typeLabel setText:[self.type stringValue]];
    
    //
    [cell.meaningLabel setText:[self getFullMeaningCN]];
}

#pragma mark -

- (NSString*)getTypeString
{
    switch ([self.type intValue]) {
        case 0:
            return @" oth.";
            break;
        case 1:
            return @"   n.";
            break;
        case 2:
            return @"   v.";
            break;
        case 3:
            return @" adj.";
            break;
        case 4:
            return @" adv.";
            break;
        case 5:
            return @"prep.";
            break;
        case 6:
            return @"conj.";
            break;
        case 7:
            return @"  vt.";
            break;
        case 8:
            return @"  vi.";
            break;
        case 9:
            return @" oth.";
            break;
        default:
        {
            // 组合词性
            return @"   .";
            
            break;
        }
    }
}

- (NSString*)getBriefMeaning
{
    NSString* string = [NSString stringWithFormat:@""];
    
    int i = 0;
    for (AhdDictMeaning* ahdDictMeaning in self.meaning) {
        if (!i) {
            string = [string stringByAppendingFormat:@"%@\t\t%@\n", [self getTypeString], [ahdDictMeaning getShortMeaning]];
        } 
        else {
            string = [string stringByAppendingFormat:@"\t\t\t\t\t\t%@\n", [ahdDictMeaning getShortMeaning]];
        }
        i++;
    }
    
    return string;
}

- (NSString*)getFullMeaningCN
{
    NSString* string = [NSString stringWithFormat:@""];
    
    int i = 1;
    for (AhdDictMeaning* ahdDictMeaning in self.meaning) {
        string = [string stringByAppendingFormat:@"%d. %@\n", i, ahdDictMeaning.meaning_cn];
        i++;
    }
    
    return string;
}

@end
