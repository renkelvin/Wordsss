//
//  WordCellMem.m
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "WordCellMem.h"

@implementation WordCellMem

@synthesize word_association, word_rootaffix, word_sense;
@synthesize association, rootaffix, sense;
@synthesize addButton;
@synthesize nameLabel, meaningLabel, memLabel;
@synthesize wordPosLevelImageView, wordPosLevelLeftImageView, wordPosLevelBodyImageView, wordPosLevelRightImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)addButtonClicked:(id)sender
{
    //
    TodayVirtualActor* tva = [TodayVirtualActor todayVirtualActor];
    Word* word = nil;
    
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    WordRecord* wr = nil;
    
    // Word
    if (self.association) {
        ;
    }
    else if (self.rootaffix) {
        ;
    }
    else if (self.sense) {
        ;
    }
    else if (self.word_association) {
        word = [self.word_association.word getTargetWord];
    }
    else if (self.word_rootaffix) {
        word = [self.word_rootaffix.word getTargetWord];
    }
    else if (self.word_sense) {
        word = [self.word_sense.word getTargetWord];
    }
    
    //
    if (word) {
        //
        [uva createWordRecord:word forUser:tva.user];
        
        //
        wr = [uva getWordRecord:word];
        
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
    }
}

- (void)configCell
{
    //
    if (self.association) {
        ;
    }
    
    //
    else if (self.rootaffix) {
        [self.nameLabel setText:self.rootaffix.phrase];
        [self.meaningLabel setText:self.rootaffix.meaning_cn];
        [self.memLabel setText:self.rootaffix.deformation];
    }
    
    // Sense
    else if (self.sense) {
        [self.nameLabel setText:self.sense.meaning_cn];
        [self.meaningLabel setText:[self.sense getTrack]];
        [self.memLabel setText:@""];
    }
    
    // Word_Association
    else if (self.word_association) {
        [self.nameLabel setText:self.word_association.word.name];
        [self.meaningLabel setText:self.word_association.meaning_cn];
        [self.memLabel setText:self.word_association.association.description_cn];
    }
    
    // Word_Rootaffix
    else if (self.word_rootaffix) {
        [self.nameLabel setText:self.word_rootaffix.word.name];
        [self.meaningLabel setText:self.word_rootaffix.meaning_cn];
        [self.memLabel setText:self.word_rootaffix.equation];
    }
    
    // Word_Sense
    else if (self.word_sense) {
        [self.nameLabel setText:self.word_sense.word.name];
        [self.meaningLabel setText:self.word_sense.meaning_cn];
        [self.memLabel setText:@""];
    }
    
    // WordPos Level Bar
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    WordRecord* wr = nil;
    
    if (self.association)
        ;
    else if (self.rootaffix)
        ;
    else if (self.sense) 
        ;
    else if (self.word_association) 
        wr = [uva getWordRecord:self.word_association.word];
    else if (self.word_rootaffix) 
        wr = [uva getWordRecord:self.word_rootaffix.word];
    else if (self.word_sense)
        wr = [uva getWordRecord:self.word_sense.word];
    
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

- (void)clear
{
    self.association = nil;
    self.rootaffix = nil;
    self.sense = nil;
    self.word_association = nil;
    self.word_rootaffix = nil;
    self.word_sense = nil;
}

@end
