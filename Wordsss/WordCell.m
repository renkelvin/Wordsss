//
//  WordCell.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "WordCell.h"

@implementation WordCell

@synthesize word;
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

- (void)configCell
{
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
        NSString* string = [NSString stringWithFormat:@"啊！这个词怎么会出现在这里的！"];
        [self.meaningLabel setText:string];
    }
    
    // WordPos Level Bar
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    WordRecord* wr = [uva getWordRecord:self.word];
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
    
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    WordRecord* wr = nil;
    
    // Word
        w = self.word;
    
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
