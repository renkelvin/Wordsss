//
//  DictWordCell.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "DictWordCell.h"

@implementation DictWordCell

@synthesize meaningBlueLabel, meaningGreyLabel;
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
    if (!self.meaningBlueLabel) {
        self.meaningBlueLabel = [[UILabel alloc] init];
    }
    if (!self.meaningGreyLabel) {
        self.meaningGreyLabel = [[UILabel alloc] init];
    }
    
    // AhdDictWord
    if (self.ahdDictWord) {
        //
        [self.meaningBlueLabel setText:[self.ahdDictWord getFullMeaningCN]];
        [self.meaningGreyLabel setText:@""];
    }
    
    // MwcDictWord
    else if (self.mwcDictWord) {
        //
        [self.meaningBlueLabel setText:[self.mwcDictWord getFunction]];
        [self.meaningGreyLabel setText:[self.mwcDictWord getMeaningEN]];
    }
    
    // AhdDictSentence
    else if (self.ahdDictSentence) {
        //
        [self.meaningBlueLabel setText:self.ahdDictSentence.meaning_cn];
        [self.meaningGreyLabel setText:self.ahdDictSentence.meaning_en];
    }
    
    //
    NSString* stringCN = self.meaningBlueLabel.text;
    UIFont *fontCN = self.meaningBlueLabel.font;
    CGSize sizeCN = CGSizeMake(280,2000);
    CGSize labelsizeCN = [stringCN sizeWithFont:fontCN constrainedToSize:sizeCN lineBreakMode:UILineBreakModeWordWrap];
    self.meaningBlueLabel.frame = CGRectMake(20,10, labelsizeCN.width, labelsizeCN.height);
    
    NSString* stringEN = self.meaningGreyLabel.text;
    UIFont *fontEN = self.meaningGreyLabel.font;
    CGSize sizeEN = CGSizeMake(280,2000);
    CGSize labelsizeEN = [stringEN sizeWithFont:fontEN constrainedToSize:sizeEN lineBreakMode:UILineBreakModeWordWrap];
    self.meaningGreyLabel.frame = CGRectMake(20,10, labelsizeEN.width, labelsizeEN.height);
    
    //
    CGRect frame = self.meaningGreyLabel.frame;
    frame.origin.y = self.meaningBlueLabel.frame.origin.y + self.meaningBlueLabel.frame.size.height - 0;
    self.meaningGreyLabel.frame = frame;
}

- (void)clear
{
    self.ahdDictWord = nil;
    self.mwcDictWord = nil;
    self.ahdDictSentence = nil;
}

- (CGFloat)getHeight
{
    CGFloat height = 0;
    
    if (self.meaningGreyLabel.frame.size.height == 0) {
        height = self.meaningBlueLabel.frame.origin.y + self.meaningBlueLabel.frame.size.height + 10;
    }
    else {
        height = self.meaningGreyLabel.frame.origin.y + self.meaningGreyLabel.frame.size.height + 10;
    }
    
    return height;
}

@end
