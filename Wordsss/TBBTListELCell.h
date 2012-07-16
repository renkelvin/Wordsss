//
//  TBBTListELCell.h
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TBBTListELCell : UITableViewCell

@property (nonatomic, retain) NSNumber* seasonNum;
@property (nonatomic, retain) NSNumber* episodeNum;

@property (nonatomic, retain) IBOutlet UILabel* nameLabel;
@property (nonatomic, retain) IBOutlet UILabel* meaningLabel;

- (void)configCell;

@end
