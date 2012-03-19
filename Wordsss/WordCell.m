//
//  WordCell.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "WordCell.h"

@implementation WordCell

@synthesize word, pureWord;
@synthesize addButton;
@synthesize nameLabel, meaningLabel;
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

- (void)getWordByPureWord
{
    if (self.pureWord && !self.word) {
        // WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
        // self.word = [wdm getWordWithName:self.pureWord.name];
        
        self.word = self.pureWord.word;
    }
}

- (void)configCell
{
    if (!self.word) {
        [self getWordByPureWord];
    }
    
    if (self.word) {
        // ahdDictWord Existing
        if (self.word.word_dict.ahdDictWord) {
            [self.nameLabel setText:self.word.name];
            [self.meaningLabel setText:[self.word getSummaryMeaning]]; 
        }
        
        // convOrig word Existing
        else if (self.word.word_relation.convOrig) {
            [self.nameLabel setText:self.word.name];
            NSString* string = [NSString stringWithFormat:@"变形自\n%@ %@", self.word.word_relation.convOrig.name, [self.word.word_relation.convOrig getSummaryMeaning]];
            [self.meaningLabel setText:string];
        }
        
        // deriOrig word Existing
        else if (self.word.word_relation.deriOrig) {
            [self.nameLabel setText:self.word.name];
            NSString* string = [NSString stringWithFormat:@"继承自\n%@ %@", self.word.word_relation.deriOrig.name, [self.word.word_relation.deriOrig getSummaryMeaning]];
            [self.meaningLabel setText:string];
        }
        
        //
        else {
            [self.nameLabel setText:self.word.name];
            NSString* string = [NSString stringWithFormat:@""];
            [self.meaningLabel setText:string];
        }
    }
    else if (self.pureWord) {
        [self.nameLabel setText:self.pureWord.name];
    }
    
    //
    TodayVirtualActor* tva = [TodayVirtualActor todayVirtualActor];
    
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    WordRecord* wr = nil;
    
    //
    if (self.word) {
        //
        [uva createWordRecord:self.word forUser:tva.user];
        
        //
        wr = [uva getWordRecord:self.word];
        
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

- (IBAction)addButtonClicked:(id)sender
{
    //
    TodayVirtualActor* tva = [TodayVirtualActor todayVirtualActor];
    
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    WordRecord* wr = nil;
    
    //
    if (self.word) {
        //
        [uva createWordRecord:self.word forUser:tva.user];
        
        //
        wr = [uva getWordRecord:self.word];
        
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

- (void)clear
{
    self.word = nil;
    
    self.pureWord = nil;
}

@end
