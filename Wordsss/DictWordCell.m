//
//  DictWordCell.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "DictWordCell.h"

@implementation DictWordCell

@synthesize ahdDictWord, mwcDictWord, ahdDictSentence;
@synthesize pronunciationButton, pronunciationLabel;

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

- (void)addString:(NSString*)string blue:(BOOL)isBlue
{
    // Blue
    if (isBlue) {
        //
        UILabel* label = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:2];
        [label setText:string];
        //
        UIFont *fontBlue = label.font;
        CGSize sizeBlue = CGSizeMake(280,2000);
        CGSize labelsizeBlue = [string sizeWithFont:fontBlue constrainedToSize:sizeBlue lineBreakMode:UILineBreakModeWordWrap];
        label.frame = CGRectMake(_criticalPoiont.x, _criticalPoiont.y, labelsizeBlue.width, labelsizeBlue.height);
        //
        [self addSubview:label];
        [_labelArray addObject:label];
        //
        _criticalPoiont.y += label.frame.size.height;
    }
    // Grey
    else {
        UILabel* label = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:3];
        [label setText:string];
        //
        UIFont *fontGrey = label.font;
        CGSize sizeGrey = CGSizeMake(280,2000);
        CGSize labelsizeGrey = [string sizeWithFont:fontGrey constrainedToSize:sizeGrey lineBreakMode:UILineBreakModeWordWrap];
        label.frame = CGRectMake(_criticalPoiont.x, _criticalPoiont.y, labelsizeGrey.width, labelsizeGrey.height);
        //
        [self addSubview:label];
        [_labelArray addObject:label];
        //
        _criticalPoiont.y += label.frame.size.height;
    }
}

- (void)configCell
{
    // AhdDictWord
    if (self.ahdDictWord) {
        // Pronunciation
        if (self.ahdDictWord.pronunciation) {
            [self.pronunciationLabel setHidden:NO];
            [self.pronunciationLabel setText:[NSString stringWithFormat:@"3%@5", self.ahdDictWord.pronunciation]];
            [self.pronunciationLabel setFont:[UIFont fontWithName:@"Basemic" size:15.0]];
            
            [self.pronunciationButton setHidden:NO];
            // CGRect frame = self.pronunciationButton.frame;
            // frame.origin.x = self.pronunciationLabel.frame.origin.x + self.pronunciationLabel.frame.origin.x + self.pronunciationLabel.frame.size.width + 5;
            // [self.pronunciationButton setFrame:frame];
            
            _criticalPoiont.y += 23;
        }
        
        //type
        [self addString:[self.ahdDictWord getFullTypeString] blue:NO];
        
        _criticalPoiont.y += 5;
        
        //
        int i = 1;
        for (AhdDictMeaning* meaning in self.ahdDictWord.meaning) {
            
            _criticalPoiont.y += 5;
            
            NSString* shortMeaning = [meaning getShortMeaning];
            if (shortMeaning)
            {
                [self addString:[NSString stringWithFormat:@"%d. %@", i, shortMeaning] blue:YES];
                i++;
            }
            //
            NSString* longMeaning = [meaning getLongMeaning];
            if (longMeaning) {
                [self addString:longMeaning blue:NO];
            }
        }
    }
    
    // MwcDictWord
    else if (self.mwcDictWord) {
        //
        [self addString:[self.mwcDictWord getFunction] blue:NO];
        //
        _criticalPoiont.y += 3;
        //
        [self addString:[self.mwcDictWord getMeaningEN] blue:YES];
    }
    
    // AhdDictSentence
    else if (self.ahdDictSentence) {
        //
        [self addString:self.ahdDictSentence.meaning_en blue:YES];
        [self addString:self.ahdDictSentence.meaning_cn blue:NO];
    }
}

- (void)clear
{
    //
    _criticalPoiont = CGPointMake(20, 10);
    
    //
    if (!_labelArray) {
        _labelArray = [NSMutableArray array];
    }
    
    for (UILabel* label in _labelArray) {
        [label removeFromSuperview];
    }
    
    //
    self.ahdDictWord = nil;
    self.mwcDictWord = nil;
    self.ahdDictSentence = nil;
    
    //
    [self.pronunciationButton setHidden:YES];
    [self.pronunciationLabel setHidden:YES];
}

- (CGFloat)getHeight
{
    return _criticalPoiont.y + 10;
}

@end
