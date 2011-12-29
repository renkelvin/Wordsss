//
//  Init1stViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKNavigationController.h"
#import "RKNavigationControllerDelegate.h"

#import "Init2ndViewController.h"

#import "InitVirtualActor.h"

@interface Init1stViewController : UIViewController <RKNavigationControllerDelegate, UINavigationControllerDelegate>
{
    //
    InitVirtualActor* _initVirtualActor;
}

@end
