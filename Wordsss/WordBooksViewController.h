//
//  WordBooksViewController.h
//  Wordsss
//
//  Created by Ren Kelvin on 10/5/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WordVirtualActor.h"

#import "AhdDictWord.h"

#import "DictWordCell.h"

@interface WordBooksViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    //
    WordVirtualActor* _wordVirtualActor;
}

- (WordBooksViewController*)init:(WordVirtualActor*)wordVirtualActor;

@end
