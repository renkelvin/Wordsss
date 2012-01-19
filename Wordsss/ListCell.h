//
//  ListCell.h
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "List.h"

@interface ListCell : UITableViewCell

@property (nonatomic, retain) List* list;

@property (nonatomic, retain) IBOutlet UIImageView* thumbImageView;
@property (nonatomic, retain) IBOutlet UILabel* nameLabel;
@property (nonatomic, retain) IBOutlet UILabel* countLabel;

- (void)configCell;

@end
