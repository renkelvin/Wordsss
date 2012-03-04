//
//  WordRelationsViewController.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-6.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WordViewController.h"

#import "WordVirtualActor.h"

#import "RKTableHeader.h"
#import "WordCell.h"

@interface WordRelationsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    //
    WordVirtualActor* _wordVirtualActor;
}

@property (nonatomic, retain) UIViewController* wordViewController;

@property (nonatomic, retain) IBOutlet UITableView* mainTableView;
@property (nonatomic, retain) IBOutlet UIImageView* placeHolderImageView;

- (WordRelationsViewController*)init:(WordVirtualActor*)wordVirtualActor;

@end
