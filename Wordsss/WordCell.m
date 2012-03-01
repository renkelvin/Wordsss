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
        NSString* string = [NSString stringWithFormat:@""];
        [self.meaningLabel setText:string];
    }
}

@end
