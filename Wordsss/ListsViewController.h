//
//  ListsViewController.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-2.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKNavigationController.h"
#import "RKNavigationControllerDelegate.h"

#import "RKTableHeader.h"

@interface ListsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, RKNavigationControllerDelegate>

@end
