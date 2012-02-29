//
//  MAListViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 2/29/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "List.h"

#import "RKTableHeader.h"

#import "WordViewController.h"

#import "MAListWordCell.h"

#import "WordsssDBDataManager.h"

@interface MAListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    List* _list;
    NSArray* _listWordArray;    
}

- (MAListViewController*)initWithList:(List*)list;

- (IBAction)navigationBackButtonClicked:(id)sender;

@end
