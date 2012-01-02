//
//  DictWordCell.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "DictWordCell.h"

@implementation DictWordCell

@synthesize typeLabel, meaningLabel;
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
    if (!self.typeLabel) {
        self.typeLabel = [[UILabel alloc] init];
    }
    if (!self.meaningLabel) {
        self.meaningLabel = [[UILabel alloc] init];
    }
    
    // AhdDictWord
    if (self.ahdDictWord) {
        //
        [self.typeLabel setText:[self.ahdDictWord.type stringValue]];
        [self.meaningLabel setText:[self.ahdDictWord getFullMeaningCN]];
    }
    
    // AhdDictSentence
    else if (self.ahdDictSentence) {
        //
        [self.typeLabel setText:@"from: 美国传统词典"];
        [self.meaningLabel setText:self.ahdDictSentence.meaning_cn];
    }
    
    //
    [self.typeLabel sizeToFit];
    [self.meaningLabel sizeToFit];
}

- (void)clear
{
    self.ahdDictWord = nil;
    self.ahdDictSentence = nil;
}

- (CGFloat)getHeight
{
    CGFloat height = 10 + self.typeLabel.frame.size.height + self.meaningLabel.frame.size.height;
    
    //    return [NSNumber numberWithFloat:height];
    return height;
}

@end
