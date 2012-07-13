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
    
    int count[51] = {
        0,
        108,  219,  331,  439,  550,  669,  759,  875,  980,  1003,
        1154, 1269, 1385, 1490, 1599, 1721, 1845, 1930, 2012, 2203,
        2345, 2431, 2523, 2631, 2776, 2890, 3000, 3103, 3200, 3304,
        3445, 3521, 3643, 3754, 3880, 3912, 4035, 4154, 4300, 4413,
        4523, 4631, 4768, 4854, 4991, 5121, 5218, 5320, 5421, 5522
    };
    
    int a = [listNum intValue] - 1;
    int b = [listNum intValue];
    a = count[a];
    b = count[b];
    [self.meaningLabel setText:[NSString stringWithFormat:@"%d 个词", b-a]];
}

@end
