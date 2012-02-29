//
//  GRERBLLListViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 2/29/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "List.h"

#import "GRERBListListCell.h"
#import "GRERBWLListViewController.h"

#import "WordViewController.h"

#import "WordsssDBDataManager.h"

@interface GRERBLLListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    List* _list;
}

@property (nonatomic, retain) IBOutlet UILabel* titleLabel;

- (GRERBLLListViewController*)initWithList:(List*)list;

- (IBAction)navigationBackButtonClicked:(id)sender;

@end
