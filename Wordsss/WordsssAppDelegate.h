//
//  WordsssAppDelegate.h
//  Wordsss
//
//  Created by Ren Kelvin on 10/1/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKTabBarController.h"

#import "XMLParser.h"

#import "TodayVirtualActor.h"

#define kUserDefaultKeyLoginCount @"kUserDefaultKeyLoginCount"

#define kUserDefaultKeyHasInitUser @"kUserDefaultKeyHasInitUser"

#define kUserDefaultKeyHasChangeWDBV11 @"kUserDefaultKeyHasChangeWDBV11"

@interface WordsssAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
