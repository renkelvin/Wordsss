//
//  InfoCell.m
//  Wordsss
//
//  Created by Ren Chuan on 1/3/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "InfoCell.h"

@implementation InfoCell

@synthesize infoLabel, valuLabel;

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

@end
