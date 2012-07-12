//
//  TBBTListSLCell.m
//  Wordsss
//
//  Created by Kelvin Ren on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "TBBTListSLCell.h"

@implementation TBBTListSLCell

@synthesize nameLabel, meaningLabel;

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
    [self.nameLabel setText:[NSString stringWithFormat:@"Season %d", [self.seasonNum intValue]]];
    [self.meaningLabel setText:[NSString stringWithFormat:@"n 个词"]];
}

@end
