//
//  WordCellBrief.m
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "WordCellBrief.h"

@implementation WordCellBrief

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        [self setLineBreakMode:UILineBreakModeWordWrap];
    }
    return self;
}

@end
