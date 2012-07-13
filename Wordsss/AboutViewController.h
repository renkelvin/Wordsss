//
//  AboutViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 3/4/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

#import "PatentViewController.h"
#import "RKTabBarController.h"

@interface AboutViewController : UIViewController <MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate, UIAlertViewDelegate, UIActionSheetDelegate>

- (IBAction)lastStep;

- (IBAction)patentButtonClicked:(id)sender;
- (IBAction)shareButtonClicked:(id)sender;
- (IBAction)feedbackButtonClicked:(id)sender;
- (IBAction)rateButtonClicked:(id)sender;

@end
