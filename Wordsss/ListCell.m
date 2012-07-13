//
//  ListCell.m
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "ListCell.h"

@implementation ListCell

@synthesize list;
@synthesize thumbImageView, nameLabel, countLabel;

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

- (NSString*)getImgString
{
    NSString* imgString = [NSString string];
    
    if ([list.name compare:@"数学词表"] == NSOrderedSame) {
        imgString = @"wl_math.png";
    }
    else if ([list.name compare:@"物理词表"] == NSOrderedSame) {
        imgString = @"";
    }
    else if ([list.name compare:@"计算机词表"] == NSOrderedSame) {
        imgString = @"wl_computer.png";
    }
    else if ([list.name compare:@"GRE红宝书"] == NSOrderedSame) {
        imgString = @"";
    }
    else if ([list.name compare:@"GRE蓝宝书"] == NSOrderedSame) {
        imgString = @"";
    }
    else if ([list.name compare:@"TBBT词表"] == NSOrderedSame) {
        imgString = @"wl_bbt.png";
    }
    else if ([list.name compare:@"DOTA词表"] == NSOrderedSame) {
        imgString = @"wl_dota.png";
    }
    
    return imgString;
}

- (void)configCell
{
    [self.nameLabel setText:list.name];
    
    [self.countLabel setText:[NSString stringWithFormat:@"%d 个词", [list.num intValue]]];
    if ([list.num intValue] == 0) {
        [self.countLabel setText:[NSString stringWithFormat:@"即将推出"]];
    }
    
    [self.thumbImageView setImage:[UIImage imageNamed:[self getImgString]]];
}

@end
