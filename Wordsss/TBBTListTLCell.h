//
//  TBBTListTLCell.h
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TBBTListWord.h"
#import "TBBTListSentence.h"

@interface TBBTListTLCell : UITableViewCell

@property (nonatomic, retain) TBBTListSentence* tbbtListSentence;

@property (nonatomic, retain) IBOutlet UILabel* nameLabel;
@property (nonatomic, retain) IBOutlet UILabel* meaningLabel;

- (void)configCell;

@end
