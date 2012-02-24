//
//  ListWordCell.h
//  Wordsss
//
//  Created by Ren Chuan on 1/14/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Word.h"
#import "MAListWord.h"
#import "PHListWord.h"
#import "CSListWord.h"

#import "UserVirtualActor.h"
#import "TodayVirtualActor.h"

#import "WordRecord.h"

@interface ListWordCell : UITableViewCell

@property (nonatomic, retain) MAListWord* maListWord;
@property (nonatomic, retain) PHListWord* phListWord;
@property (nonatomic, retain) CSListWord* csListWord;

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
