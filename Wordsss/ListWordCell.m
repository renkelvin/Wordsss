//
//  ListWordCell.m
//  Wordsss
//
//  Created by Ren Chuan on 1/14/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "ListWordCell.h"

@implementation ListWordCell

@synthesize maListWord, phListWord, csListWord;

@synthesize nameLabel, meaningLabel;
@synthesize addButton;
@synthesize wordPosLevelImageView, wordPosLevelLeftImageView, wordPosLevelBodyImageView, wordPosLevelRightImageView;

- (void)configCell
{
    if (self.maListWord) {
        [self.nameLabel setText:self.maListWord.word_list.word.name];
        [self.meaningLabel setText:self.maListWord.meaning];
    }
    else if (self.phListWord) {
        [self.nameLabel setText:self.phListWord.word_list.word.name];
        [self.meaningLabel setText:self.phListWord.meaning];
    }
    else if (self.csListWord) {
        [self.nameLabel setText:self.csListWord.word_list.word.name];
        [self.meaningLabel setText:self.csListWord.meaning];
    }
}

@end
