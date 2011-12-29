//
//  Init2ndViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKNavigationController.h"
#import "RKNavigationControllerDelegate.h"

#import "Init3rdViewController.h"

#import "InitVirtualActor.h"

@interface Init2ndViewController : UIViewController <RKNavigationControllerDelegate, UINavigationControllerDelegate>
{
    //
    InitVirtualActor* _initVirtualActor;
}

@end

enum VocabularyLevel {VLBASIC, VLMIDDLE, VLHIGH, VLCET4, VLCET6, VLTOFEL, VLGRE, VLGMAT, VLGODLIKE, VLHOlYSHIT};