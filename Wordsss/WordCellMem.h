//
//  WordCellMem.h
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Word_Association.h"
#import "Word_Rootaffix.h"
#import "Word_Sense.h"
#import "Association.h"
#import "Rootaffix.h"
#import "Sense.h"

#import "UserDataManager.h"

#import "TodayVirtualActor.h"

#import "WordCell.h"

@interface WordCellMem : UITableViewCell

@property (nonatomic, retain) Word_Association* word_association;
@property (nonatomic, retain) Word_Rootaffix* word_rootaffix;
@property (nonatomic, retain) Word_Sense* word_sense;

@property (nonatomic, retain) Association* association;
@property (nonatomic, retain) Rootaffix* rootaffix;
@property (nonatomic, retain) Sense* sense;

@property (nonatomic, retain) IBOutlet UIButton* addButton;

@property (nonatomic, retain) IBOutlet UILabel* nameLabel;
@property (nonatomic, retain) IBOutlet UILabel* meaningLabel;
@property (nonatomic, retain) IBOutlet UILabel* memLabel;

@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelLeftImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelBodyImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelRightImageView;

- (IBAction)addButtonClicked:(id)sender;

- (void)configCell;
- (void)clear;

@end
