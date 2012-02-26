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
    
    // WordPos Level Bar
    Word* w = nil;
    
    if (self.maListWord) {
        w = self.maListWord.word_list.word;
    }
    else if (self.phListWord) {
        w = self.phListWord.word_list.word;
    }
    else if (self.csListWord) {
        w = self.csListWord.word_list.word;
    }
    
    //
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    WordRecord* wr = [uva getWordRecord:w];
    
    if (wr) {
        [self.addButton setHidden:YES];
        
        [self.wordPosLevelLeftImageView setHidden:NO];
        [self.wordPosLevelBodyImageView setHidden:NO];
        [self.wordPosLevelRightImageView setHidden:NO];
        
        int bodyWidth = 0;
        
        if ([wr.level intValue] == -1) {
            bodyWidth = 281;
        }
        else {
            bodyWidth = 281 / 11.0 * [wr.level intValue];
        }
        
        CGRect frame;
        
        frame = self.wordPosLevelBodyImageView.frame;
        frame.size.width = bodyWidth;
        self.wordPosLevelBodyImageView.frame = frame;
        
        frame = self.wordPosLevelRightImageView.frame;
        frame.origin.x = 20 + bodyWidth;
        self.wordPosLevelRightImageView.frame = frame;
    }
    else {
        [self.addButton setHidden:NO];
        
        [self.wordPosLevelLeftImageView setHidden:YES];
        [self.wordPosLevelBodyImageView setHidden:YES];
        [self.wordPosLevelRightImageView setHidden:YES];
    }
}

- (IBAction)addButtonClicked:(id)sender
{
    //
    TodayVirtualActor* tva = [TodayVirtualActor todayVirtualActor];
    Word* w = nil;
    
    if (self.maListWord) {
        w = self.maListWord.word_list.word;
    }
    else if (self.phListWord) {
        w = self.phListWord.word_list.word;
    }
    else if (self.csListWord) {
        w = self.csListWord.word_list.word;
    }
    
    //
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    WordRecord* wr = nil;
    
    //
    if (w) {
        //
        [uva createWordRecord:w forUser:tva.user];
        
        //
        wr = [uva getWordRecord:w];
        
        // WordPos Level Bar
        if (wr) {
            [self.addButton setHidden:YES];
            
            [self.wordPosLevelLeftImageView setHidden:NO];
            [self.wordPosLevelBodyImageView setHidden:NO];
            [self.wordPosLevelRightImageView setHidden:NO];
            
            int bodyWidth = 0;
            
            if ([wr.level intValue] == -1) {
                bodyWidth = 281;
            }
            else {
                bodyWidth = 281 / 11.0 * [wr.level intValue];
            }
            
            CGRect frame;
            
            frame = self.wordPosLevelBodyImageView.frame;
            frame.size.width = bodyWidth;
            self.wordPosLevelBodyImageView.frame = frame;
            
            frame = self.wordPosLevelRightImageView.frame;
            frame.origin.x = 20 + bodyWidth;
            self.wordPosLevelRightImageView.frame = frame;
        }
        else {
            [self.addButton setHidden:NO];
            
            [self.wordPosLevelLeftImageView setHidden:YES];
            [self.wordPosLevelBodyImageView setHidden:YES];
            [self.wordPosLevelRightImageView setHidden:YES];
        }
    }
}

@end
