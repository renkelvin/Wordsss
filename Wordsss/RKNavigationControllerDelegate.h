//
//  RKNavigationControllerDelegate.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-6.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RKNavigationController.h"

@protocol RKNavigationControllerDelegate <NSObject>

- (void)initNavigationBar;

- (void)navigationBarLeftButtonDown;
- (void)navigationBarRightButtonDown;

@end
