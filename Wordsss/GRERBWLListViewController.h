//
//  GRERBWLListViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 2/29/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "List.h"

#import "GRERBListWordCell.h"

#import "WordViewController.h"

#import "WordsssDBDataManager.h"

@interface GRERBWLListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    List* _list;
    NSNumber* _listNum;
    
    NSArray* _listWordArray;    
}

@property (nonatomic, retain) IBOutlet UILabel* titleLabel;

- (GRERBWLListViewController*)initWithList:(List*)list listNum:(NSNumber*)listNum;

- (IBAction)navigationBackButtonClicked:(id)sender;

@end
