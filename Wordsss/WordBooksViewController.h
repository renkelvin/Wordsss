//
//  WordBooksViewController.h
//  Wordsss
//
//  Created by Ren Kelvin on 10/5/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TodayViewController.h"

#import "WordVirtualActor.h"

#import "AhdDictWord.h"
#import "AhdDictMeaning.h"
#import "AhdDictSentence.h"

#import "DictWordCell.h"
#import "RKTableHeader.h"

@interface WordBooksViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    //
    WordVirtualActor* _wordVirtualActor;
}

- (WordBooksViewController*)init:(WordVirtualActor*)wordVirtualActor;

@end
