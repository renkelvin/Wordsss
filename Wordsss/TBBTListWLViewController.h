//
//  TBBTListWLViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "List.h"
#import "TBBTListSentence.h"

#import "WordViewController.h"

@interface TBBTListWLViewController : UIViewController <UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    NSArray* _listWordArray;
}

@property (nonatomic, retain) IBOutlet UILabel* titleLabel;

#pragma mark - Instance method

- (TBBTListWLViewController*)initWithListWordArray:(NSArray*)array;

@end
