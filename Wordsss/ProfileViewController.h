//
//  ProfileViewController.h
//  Wordsss
//
//  Created by Ren Kelvin on 10/1/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKNavigationController.h"
#import "RKNavigationControllerDelegate.h"

@interface ProfileViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, RKNavigationControllerDelegate>
{

}

@property (nonatomic, retain) IBOutlet UIImageView* profileImageView;
@property (nonatomic, retain) IBOutlet UILabel* nicknameLabel;

@end
