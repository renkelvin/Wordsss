//
//  CSListViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 2/29/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "List.h"

#import "CSListWordCell.h"

#import "WordViewController.h"

#import "WordsssDBDataManager.h"

@interface CSListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    List* _list;
    NSArray* _listWordArray;    
    
}

@property (nonatomic, retain) IBOutlet UILabel* titleLabel;

- (CSListViewController*)initWithList:(List*)list;

- (IBAction)navigationBackButtonClicked:(id)sender;

@end
