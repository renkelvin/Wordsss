//
//  WordMemsViewController.h
//  Wordsss
//
//  Created by Ren Kelvin on 10/5/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WordViewController.h"

#import "WordVirtualActor.h"

#import "Word_Association.h"
#import "Word_Rootaffix.h"
#import "Word_Sense.h"

#import "RKTableHeader.h"
#import "WordCellMem.h"

@interface WordMemsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    //
    WordVirtualActor* _wordVirtualActor;
}

@property (nonatomic, retain) UIViewController* wordViewController;

@property (nonatomic, retain) IBOutlet UITableView* mainTableView;
@property (nonatomic, retain) IBOutlet UIImageView* placeHolderImageView;

- (WordMemsViewController*)init:(WordVirtualActor*)wordVirtualActor;

@end
