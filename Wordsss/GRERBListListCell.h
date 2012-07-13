//
//  GRERBListListCell.h
//  Wordsss
//
//  Created by Ren Chuan on 2/26/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GRERBLLListViewController.h"

//static int countArray[51] = {
//    0,      
//    108,  219,  331,  439,  550,  669,  759,  875,  980,  1003,
//    1154, 1269, 1385, 1490, 1599, 1721, 1845, 1930, 2012, 2203,
//    2345, 2431, 2523, 2631, 2776, 2890, 3000, 3103, 3200, 3304,
//    3445, 3521, 3643, 3754, 3880, 3912, 4035, 4154, 4300, 4413,
//    4523, 4631, 4768, 4854, 4991, 5121, 5218, 5320, 5421, 5522
//};

@interface GRERBListListCell : UITableViewCell

@property (nonatomic, retain) NSNumber* listNum;

@property (nonatomic, retain) IBOutlet UILabel* nameLabel;
@property (nonatomic, retain) IBOutlet UILabel* meaningLabel;

@property (nonatomic, retain) IBOutlet UIButton* addButton;

@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelLeftImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelBodyImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelRightImageView;

- (void)configCell;

@end
