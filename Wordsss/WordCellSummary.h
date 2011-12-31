//
//  WordCellSummary.h
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Word.h"

#import "UserDataManager.h"

#import "TodayVirtualActor.h"

@interface WordCellSummary : UITableViewCell

@property (nonatomic, retain) Word* word;

@property (nonatomic, retain) IBOutlet UILabel* nameLabel;
@property (nonatomic, retain) IBOutlet UILabel* meaningLabel;

- (IBAction)addButtonClicked:(id)sender;

- (void)configCell;

@end
