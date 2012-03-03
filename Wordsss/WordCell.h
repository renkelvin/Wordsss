//
//  WordCell.h
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Word.h"
#import "PureWord.h"

#import "UserDataManager.h"

#import "TodayVirtualActor.h"
#import "UserVirtualactor.h"

@interface WordCell : UITableViewCell

@property (nonatomic, retain) Word* word;
@property (nonatomic, retain) PureWord* pureWord;

@property (nonatomic, retain) IBOutlet UILabel* nameLabel;
@property (nonatomic, retain) IBOutlet UILabel* meaningLabel;

@property (nonatomic, retain) IBOutlet UIButton* addButton;

@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelLeftImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelBodyImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelRightImageView;

- (void)clear;

- (void)configCell;

- (IBAction)addButtonClicked:(id)sender;

@end
