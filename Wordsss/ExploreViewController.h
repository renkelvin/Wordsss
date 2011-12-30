//
//  ExploreViewController.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-3.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKNavigationController.h"
#import "RKNavigationControllerDelegate.h"

#import "ExploreVirtualActor.h"

@interface ExploreViewController : UIViewController <UITabBarDelegate, UITableViewDataSource, RKNavigationControllerDelegate> {
    //
    ExploreVirtualActor* _exploreVirtualActor;
    
    //
    UISearchBar* _searchBar;    
    UITableView* _tableView;
}

@property (nonatomic, retain) IBOutlet UISearchBar* searchBar;

@property (nonatomic, retain) IBOutlet UITableView* tableView;

@end
