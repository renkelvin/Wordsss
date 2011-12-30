//
//  Word_Association.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Word_Association.h"
#import "Association.h"
#import "Word.h"


@implementation Word_Association

@dynamic id;
@dynamic meaning_cn;
@dynamic association;
@dynamic word;

- (void)configCell:(WordCellMem*)cell
{
    //
    [cell.nameLabel setText:self.word.name];
    
    //
    [cell.meaningLabel setText:self.meaning_cn];

    //
    [cell.memLabel setText:self.association.description_cn];
}

@end
