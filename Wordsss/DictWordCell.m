//
//  DictWordCell.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "DictWordCell.h"

@implementation DictWordCell

@synthesize meaningCNLabel, meaningENLabel;
@synthesize ahdDictWord, mwcDictWord, ahdDictSentence;

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
    if (!self.meaningCNLabel) {
        self.meaningCNLabel = [[UILabel alloc] init];
    }
    if (!self.meaningENLabel) {
        self.meaningENLabel = [[UILabel alloc] init];
    }
    
    [self.meaningCNLabel setText:@"E"];
    [self.meaningENLabel setText:@"E"];
    
    // AhdDictWord
    if (self.ahdDictWord) {
        //
        [self.meaningCNLabel setText:[self.ahdDictWord getFullMeaningCN]];
        [self.meaningENLabel setText:@""];
    }
    
    // MwcDictWord
    else if (self.mwcDictWord) {
        //
        [self.meaningCNLabel setText:[self.mwcDictWord getFullMeaningEN]];
        [self.meaningENLabel setText:@""];
    }
    
    // AhdDictSentence
    else if (self.ahdDictSentence) {
        //
        [self.meaningCNLabel setText:self.ahdDictSentence.meaning_cn];
        [self.meaningENLabel setText:self.ahdDictSentence.meaning_en];
    }
    
    //
    NSString* stringCN = self.meaningCNLabel.text;
    UIFont *fontCN = self.meaningCNLabel.font;
    CGSize sizeCN = CGSizeMake(280,2000);
    CGSize labelsizeCN = [stringCN sizeWithFont:fontCN constrainedToSize:sizeCN lineBreakMode:UILineBreakModeWordWrap];
    self.meaningCNLabel.frame = CGRectMake(20,10, labelsizeCN.width, labelsizeCN.height);
    
    NSString* stringEN = self.meaningENLabel.text;
    UIFont *fontEN = self.meaningENLabel.font;
    CGSize sizeEN = CGSizeMake(280,2000);
    CGSize labelsizeEN = [stringEN sizeWithFont:fontEN constrainedToSize:sizeEN lineBreakMode:UILineBreakModeWordWrap];
    self.meaningENLabel.frame = CGRectMake(20,10, labelsizeEN.width, labelsizeEN.height);
    
    //
    CGRect frame = self.meaningENLabel.frame;
    frame.origin.y = self.meaningCNLabel.frame.origin.y + self.meaningCNLabel.frame.size.height - 3;
    self.meaningENLabel.frame = frame;
}

- (void)clear
{
    self.ahdDictWord = nil;
    self.mwcDictWord = nil;
    self.ahdDictSentence = nil;
}

- (CGFloat)getHeight
{
    CGFloat height = self.meaningENLabel.frame.origin.y + self.meaningENLabel.frame.size.height + 10;
    
    return height;
}

@end
