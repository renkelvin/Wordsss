//
//  DictWordCell.h
//  Wordsss
//
//  Created by Ren Chuan on 12/29/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AhdDictWord.h"
#import "AhdDictSentence.h"

@interface DictWordCell : UITableViewCell

//@property (nonatomic, retain) IBOutlet UILabel* typeLabel;
@property (nonatomic, retain) IBOutlet UILabel* meaningCNLabel;
@property (nonatomic, retain) IBOutlet UILabel* meaningENLabel;

@property (nonatomic, retain) AhdDictWord* ahdDictWord;
@property (nonatomic, retain) AhdDictSentence* ahdDictSentence;

- (void)configCell;
- (void)clear;

- (CGFloat)getHeight;

@end
