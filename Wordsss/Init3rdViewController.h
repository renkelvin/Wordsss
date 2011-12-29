//
//  Init3rdViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WordsssAppDelegate.h"

#import "RKNavigationController.h"
#import "RKNavigationControllerDelegate.h"

#import "TodayViewController.h"

#import "InitVirtualActor.h"

@interface Init3rdViewController : UIViewController <RKNavigationControllerDelegate, UINavigationControllerDelegate>
{
    //
    InitVirtualActor* _initVirtualActor;
}

@property (nonatomic, retain) IBOutlet RKTabBarController* rootViewController;

@end
