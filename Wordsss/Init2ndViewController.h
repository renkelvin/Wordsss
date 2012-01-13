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

#define kInitPickerViewFrameHide CGRectMake(0, 416, 320, 216)
#define kInitPickerViewFrameShow CGRectMake(0, 199, 320, 216)
#define kInitPickerAccessoryViewFrameHide CGRectMake(0, 416, 320, 44)
#define kInitPickerAccessoryViewFrameShow CGRectMake(0, 155, 320, 44)

@interface Init2ndViewController : UIViewController <RKNavigationControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    //
    InitVirtualActor* _initVirtualActor;
}

@property (nonatomic, retain) IBOutlet UIPickerView* pickerView;
@property (nonatomic, retain) IBOutlet UIView* pickerAccessoryView;

@end

enum VocabularyLevel {VLBASIC = 1, VLMIDDLE = 2, VLHIGH = 3, VLCET4 = 4, VLCET6 = 5, VLTOFEL = 7, VLGRE = 9, VLGMAT, VLGODLIKE = 10, VLHOlYSHIT};