//
//  WordRelationsViewController.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-6.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WordVirtualActor.h"

#import "RKTableHeader.h"
#import "WordCellSummary.h"

@interface WordRelationsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    //
    WordVirtualActor* _wordVirtualActor;
}

- (WordRelationsViewController*)init:(WordVirtualActor*)wordVirtualActor;

@end
