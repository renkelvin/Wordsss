//
//  TBBTListTLCell.m
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "TBBTListTLCell.h"

@implementation TBBTListTLCell

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
    //
    int ms = [self.tbbtListSentence.beginTime intValue];
    int min = ms / (60*1000);
    ms %= 60*1000;
    int sec = ms / 1000;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setMinute:min];
    [comps setSecond:sec];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:comps];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"mm:ss"];
    [self.nameLabel setText:[NSString stringWithFormat:@"[%@]", [dateFormatter stringFromDate:date]]];
    
    //
    [self.meaningLabel setText:[NSString stringWithFormat:@"%@", self.tbbtListSentence.sentence]];
}

@end
