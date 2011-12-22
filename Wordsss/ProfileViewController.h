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

#import "UserVirtualActor.h"

@interface ProfileViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, RKNavigationControllerDelegate>
{
    //
    UserVirtualActor* _userVirtualActor;
}

@property (nonatomic, retain) IBOutlet UIImageView* profileImageView;
@property (nonatomic, retain) IBOutlet UILabel* nicknameLabel;

@end
