//
//  TBBTListSLViewController.h
//  Wordsss
//
//  Created by Kelvin Ren on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "List.h"

#import "TBBTListELViewController.h"

@interface TBBTListSLViewController : UIViewController <UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource>
{
    List* _list;
}

@property (nonatomic, retain) IBOutlet UILabel* titleLabel;

- (TBBTListSLViewController*)initWithList:(List*)list;

@end
