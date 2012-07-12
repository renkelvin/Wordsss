//
//  TBBTListWLCell.h
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Word.h"
#import "WordRecord.h"
#import "TBBTListWord.h"

#import "UserVirtualActor.h"

#import "TBBTListWord.h"

@interface TBBTListWLCell : UITableViewCell

@property (nonatomic, retain) TBBTListWord* tbbtListWord;

@property (nonatomic, retain) IBOutlet UILabel* nameLabel;
@property (nonatomic, retain) IBOutlet UILabel* meaningLabel;

@property (nonatomic, retain) IBOutlet UIButton* addButton;

@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelLeftImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelBodyImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelRightImageView;

- (void)configCell;

- (IBAction)addButtonClicked:(id)sender;

@end
