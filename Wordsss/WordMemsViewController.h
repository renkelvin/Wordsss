//
//  WordMemsViewController.h
//  Wordsss
//
//  Created by Ren Kelvin on 10/5/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WordVirtualActor.h"

@interface WordMemsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    //
    WordVirtualActor* _wordVirtualActor;
}

- (WordMemsViewController*)init:(WordVirtualActor*)wordVirtualActor;

@end
