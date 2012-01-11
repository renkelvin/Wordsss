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
@synthesize ahdDictWord, ahdDictSentence;

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
    
    // AhdDictWord
    if (self.ahdDictWord) {
        //
        [self.meaningCNLabel setText:[self.ahdDictWord getFullMeaningCN]];
        [self.meaningENLabel setText:@""];
 }
    
    // AhdDictSentence
    else if (self.ahdDictSentence) {
        //
        [self.meaningCNLabel setText:self.ahdDictSentence.meaning_cn];
        [self.meaningENLabel setText:self.ahdDictSentence.meaning_en];
    }
    
    //
    [self.meaningCNLabel sizeToFit];
    [self.meaningENLabel sizeToFit];
    
    CGRect frame = self.meaningENLabel.frame;
    frame.origin.y = self.meaningCNLabel.frame.origin.y + self.meaningCNLabel.frame.size.height + 0;
    self.meaningENLabel.frame = frame;
}

- (void)clear
{
    self.ahdDictWord = nil;
    self.ahdDictSentence = nil;
}

- (CGFloat)getHeight
{
    CGFloat height = self.meaningENLabel.frame.origin.y + self.meaningENLabel.frame.size.height + 10;
    
    return height;
}

@end
