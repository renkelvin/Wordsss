//
//  GRERBListListCell.m
//  Wordsss
//
//  Created by Ren Chuan on 2/26/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "GRERBListListCell.h"

@implementation GRERBListListCell

@synthesize nameLabel, meaningLabel;
@synthesize addButton;
@synthesize wordPosLevelImageView, wordPosLevelLeftImageView, wordPosLevelBodyImageView, wordPosLevelRightImageView;

@synthesize listNum;

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
    [self.nameLabel setText:[NSString stringWithFormat:@"List %d", [self.listNum intValue]]];
}

@end
