//
//  ListViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 2/22/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Word.h"
#import "List.h"
#import "MAListWord.h"

#import "WordViewController.h"

#import "ListWordCell.h"

@interface ListViewController : UIViewController <UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    List* _list;
    NSArray* _listWordArray;
}

- (ListViewController*)initWithList:(List*)list;

- (IBAction)navigationBackButtonClicked:(id)sender;

@end
