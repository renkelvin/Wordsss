//
//  StudyRangeViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 3/4/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserVirtualActor.h"

#define kInitPickerViewFrameHide CGRectMake(0, 460, 320, 216)
#define kInitPickerViewFrameShow CGRectMake(0, 199, 320, 216)
#define kInitPickerAccessoryViewFrameHide CGRectMake(0, 416, 320, 44)
#define kInitPickerAccessoryViewFrameShow CGRectMake(0, 155, 320, 44)

@interface StudyRangeViewController : UIViewController
{
    //
    UserVirtualActor* _userVirtualActor;
    
    //
    int curORtar;   // 0 or 1
}

@property (nonatomic, retain) IBOutlet UIButton* nextStepButton;

@property (nonatomic, retain) IBOutlet UILabel* curLabel;
@property (nonatomic, retain) IBOutlet UILabel* tarLabel;

@property (nonatomic, retain) IBOutlet UIPickerView* pickerView;
@property (nonatomic, retain) IBOutlet UIView* pickerAccessoryView;

- (IBAction)nextStep;

@end

enum VocabularyLevel {VLBASIC = 1, VLMIDDLE = 2, VLHIGH = 3, VLCET4 = 4, VLCET6 = 5, VLTOFEL = 7, VLGRE = 9, VLGMAT, VLGODLIKE = 10, VLHOlYSHIT};