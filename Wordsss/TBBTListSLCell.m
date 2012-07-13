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
    
    switch ([self.seasonNum intValue]) {
        case 1:
            [self.meaningLabel setText:[NSString stringWithFormat:@"17 集全"]];
            break;
        case 2:
            [self.meaningLabel setText:[NSString stringWithFormat:@"23 集全"]];
            break;
        case 3:
        case 4:
        case 5:
            [self.meaningLabel setText:[NSString stringWithFormat:@"即将推出"]];
            break;
        default:
            break;
    }
}

@end
