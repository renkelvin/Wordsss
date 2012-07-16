//
//  TBBTListELCell.m
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "TBBTListELCell.h"

static char* episodeArrayS1[18] = {
    "",
    "Pilot",
    "The Big Bran Hypothesis",
    "The Fuzzy Boots Corollary",
    "The Luminous Fish Effect",
    "The Hamburger Postulate",
    "The Middle Earth Paradigm",
    "The Dumpling Paradox",
    "The Grasshopper Experiment",
    "The Cooper-Hofstadter Polarization",
    "The Loobenfeld Decay",
    "The Pancake Batter Anomaly",
    "The Jerusalem Duality",
    "The Bat Jar Conjecture",
    "The Nerdvana Annihilation",
    "The Pork Chop Indeterminacy",
    "The Peanut Reaction",
    "The Tangerine Factor"
};

static char* episodeArrayS2[24] = {
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
};

@implementation TBBTListELCell

@synthesize seasonNum, episodeNum;

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

#pragma mark -

- (void)configCell
{
    [self.nameLabel setText:[NSString stringWithFormat:@"Episode %d", [self.episodeNum intValue]]];
    
    NSString* name = nil;
    switch ([seasonNum intValue]) {
        case 1:
            name = [NSString stringWithFormat:@"%s", episodeArrayS1[[episodeNum intValue]]];
            break;
        case 2:
            name = [NSString stringWithFormat:@"%s", episodeArrayS2[[episodeNum intValue]]];
            break;
        default:
            break;
    }
    [self.meaningLabel setText:name];
}

@end
