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

@interface Init2ndViewController : UIViewController <RKNavigationControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    //
    InitVirtualActor* _initVirtualActor;
}

@end

enum VocabularyLevel {VLBASIC = 1, VLMIDDLE = 2, VLHIGH = 3, VLCET4 = 4, VLCET6 = 5, VLTOFEL = 7, VLGRE = 9, VLGMAT, VLGODLIKE = 10, VLHOlYSHIT};