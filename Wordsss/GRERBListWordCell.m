//
//  GRERBListWordCell.m
//  Wordsss
//
//  Created by Ren Chuan on 2/26/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "GRERBListWordCell.h"

@implementation GRERBListWordCell

@synthesize grerbListWord;

@synthesize nameLabel, meaningLabel;
@synthesize addButton;
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
    //
    [self.nameLabel setText:self.grerbListWord.word_list.word.name];
    NSLog(@"%@", self.grerbListWord.meaning_cn);
    [self.meaningLabel setText:self.grerbListWord.meaning_cn];
    
    //
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    Word* w = nil;    
    WordRecord* wr = nil;
    
    // Word
    w = self.grerbListWord.word_list.word;
    
    //
    if (w) {
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

- (IBAction)addButtonClicked:(id)sender
{
    //
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    Word* w = nil;    
    WordRecord* wr = nil;
    
    // Word
    w = self.grerbListWord.word_list.word;
    
    //
    if (w) {
        //
        [uva createWordRecord:w];
        
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
