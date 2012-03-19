//
//  GRERBListWordCell.h
//  Wordsss
//
//  Created by Ren Chuan on 2/26/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Word.h"
#import "WordRecord.h"
#import "GRERBListWord.h"

#import "UserVirtualActor.h"

@interface GRERBListWordCell : UITableViewCell

@property (nonatomic, retain) GRERBListWord* grerbListWord;

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
