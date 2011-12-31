//
//  AhdDictSentence.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "AhdDictSentence.h"
#import "AhdDictMeaning.h"

@implementation AhdDictSentence

@dynamic id;
@dynamic meaning_cn;
@dynamic meaning_en;
@dynamic ahdDictMeaning;

- (void)configCell:(DictWordCell*)cell
{
    //
    [cell.typeLabel setText:@"from: 美国传统词典"];
    
    //
    [cell.meaningLabel setText:self.meaning_cn];
}

@end
