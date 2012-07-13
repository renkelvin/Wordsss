//
//  ListsViewController.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-2.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKTableHeader.h"

#import "ListCell.h"

#import "ListsVirtualActor.h"

#import "MAListViewController.h"
#import "PHListViewController.h"
#import "CSListViewController.h"
#import "GRERBLLListViewController.h"
#import "TBBTListSLViewController.h"

@interface ListsViewController : UIViewController <UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    //
    ListsVirtualActor* _listsVirtualActor;
    
    //
    NSDictionary* _listDict;
}

- (IBAction)featureList1ButtonClicked:(id)sender;
- (IBAction)featureList2ButtonClicked:(id)sender;

@end
