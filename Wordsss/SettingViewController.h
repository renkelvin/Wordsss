//
//  SettingViewController.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-3.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

//#import "RKNavigationController.h"
//#import "RKNavigationControllerDelegate.h"

#import "SettingVirtualActor.h"

#import "Defult.h"

#define kInitPickerViewFrameHide CGRectMake(0, 460, 320, 216)
#define kInitPickerViewFrameShow CGRectMake(0, 199, 320, 216)
#define kInitPickerAccessoryViewFrameHide CGRectMake(0, 416, 320, 44)
#define kInitPickerAccessoryViewFrameShow CGRectMake(0, 155, 320, 44)

@interface SettingViewController : UIViewController <UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    SettingVirtualActor* _settingVirtualActor;

    //
    int curORtar;   // 0 or 1
}

@property (nonatomic, retain) IBOutlet UILabel* curLabel;
@property (nonatomic, retain) IBOutlet UILabel* tarLabel;

@property (nonatomic, retain) IBOutlet UITextField* nameTextField;
@property (nonatomic, retain) IBOutlet UIPickerView* pickerView;
@property (nonatomic, retain) IBOutlet UIView* pickerAccessoryView;

@end
