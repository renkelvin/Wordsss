//
//  Init2ndViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Init3rdViewController.h"

#import "InitVirtualActor.h"

#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kInitPickerViewFrameHide CGRectMake(0, (kScreenHeight - 20 - 44) + 44, 320, 216)
#define kInitPickerViewFrameShow CGRectMake(0, (kScreenHeight - 20 - 44) - 216, 320, 216)
#define kInitPickerAccessoryViewFrameHide CGRectMake(0, (kScreenHeight - 20 - 44), 320, 44)
#define kInitPickerAccessoryViewFrameShow CGRectMake(0, (kScreenHeight - 20 - 44) - 216 - 44, 320, 44)

@interface Init2ndViewController : UIViewController <UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    //
    InitVirtualActor* _initVirtualActor;
    
    //
    int curORtar;   // 0 or 1
}

@property (nonatomic, retain) IBOutlet UIButton* nextStepButton;

@property (nonatomic, retain) IBOutlet UILabel* curLabel;
@property (nonatomic, retain) IBOutlet UILabel* tarLabel;

@property (nonatomic, retain) IBOutlet UIPickerView* pickerView;
@property (nonatomic, retain) IBOutlet UIView* pickerAccessoryView;

- (IBAction)nextStep;
- (IBAction)lastStep;

@end

enum VocabularyLevel {VLBASIC = 1, VLMIDDLE = 2, VLHIGH = 3, VLCET4 = 4, VLCET6 = 5, VLTOFEL = 7, VLGRE = 9, VLGMAT, VLGODLIKE = 10, VLHOlYSHIT};