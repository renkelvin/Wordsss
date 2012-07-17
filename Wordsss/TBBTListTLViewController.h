//
//  TBBTListTLViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TBBTListWLViewController.h"

#import "WordsssDBDataManager.h"

@interface TBBTListTLViewController : UIViewController <UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSNumber* _seasonNum;
    NSNumber* _episodeNum;
    
    NSArray* _listSentenceArray;
}

@property (nonatomic, retain) IBOutlet UILabel* titleLabel;

@property (nonatomic, retain) IBOutlet UITableView* ttableView;
@property (nonatomic, retain) IBOutlet UIView* tableViewHeaderButton;

#pragma mark - IBAction

- (IBAction)headerButtonCicked:(id)sender;

#pragma mark - Instance method

- (TBBTListTLViewController*)initWithListSentenceArray:listSentenceArray seasonNum:seasonNum episodeNum:episodeNum;

@end
