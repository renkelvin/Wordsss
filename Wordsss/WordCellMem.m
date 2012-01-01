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
@synthesize nameLabel, meaningLabel, memLabel;

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
    UserDataManager* udm = [UserDataManager userdataManager];
    TodayVirtualActor* tva = [TodayVirtualActor todayVirtualActor];
    
    Word* word = nil;
    
    //
    if (self.association) {
        ;
    }
    
    //
    else if (self.rootaffix) {
        ;
    }
    
    //
    else if (self.sense) {
        
    }
    
    //
    else if (self.word_association) {
        word = [self.word_association.word getTargetWord];
    }
    
    //
    else if (self.word_rootaffix) {
        word = [self.word_rootaffix.word getTargetWord];
    }
    
    //
    else if (self.word_sense) {
        word = [self.word_sense.word getTargetWord];
    }
    
    //
    if (word) {
        [udm createWordRecord:word forUser:tva.user];
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
    }
    
    // Word_Association
    else if (self.word_association) {
        [self.nameLabel setText:self.word_association.word.name];
        [self.meaningLabel setText:self.word_association.meaning_cn];
        [self.memLabel setText:self.word_association.association.description_cn];
    }
    
    //
    else if (self.word_rootaffix) {
        [self.nameLabel setText:self.word_rootaffix.word.name];
        [self.meaningLabel setText:self.word_rootaffix.meaning_cn];
        [self.memLabel setText:self.word_rootaffix.equation];
    }
    
    // Word_Sense
    else if (self.word_sense) {
        [self.nameLabel setText:self.word_sense.word.name];
        [self.meaningLabel setText:self.word_sense.meaning_cn];
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
