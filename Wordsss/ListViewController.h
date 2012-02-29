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
#import "GRERBListListCell.h"
#import "GRERBListWordCell.h"

enum ListTableEnum {
    MALISTTABLE,
    PHLISTTABLE,
    CSLISTTABLE,
    GRERBLISTLISTTABLE, GRERBLISTWORDTABLE
};

@interface ListViewController : UIViewController <UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    List* _list;
    NSArray* _listWordArray;
    
    //
    enum ListTableEnum _listTableEnum;
}

@property (nonatomic, retain) IBOutlet UILabel* listTitleLabel;

// GRERBList
@property (nonatomic, retain) NSNumber* grerbListNum;

- (ListViewController*)initWithList:(List*)list;

- (IBAction)navigationBackButtonClicked:(id)sender;

@end
