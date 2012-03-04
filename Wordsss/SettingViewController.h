//
//  SettingViewController.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-3.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKTabBarController.h"

#import "SettingVirtualActor.h"

#import "PatentViewController.h"

#import "Defult.h"

#define kInitPickerViewFrameHide CGRectMake(0, 416, 320, 260)
#define kInitPickerViewFrameShow CGRectMake(0, 155, 320, 260)

@interface SettingViewController : UIViewController <UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UIActionSheetDelegate>
{
    SettingVirtualActor* _settingVirtualActor;
    
    //
    int curORtar;   // 0 or 1
}

@property (nonatomic, retain) IBOutlet UILabel* curLabel;
@property (nonatomic, retain) IBOutlet UILabel* tarLabel;

@property (nonatomic, retain) IBOutlet UITextField* nameTextField;
@property (nonatomic, retain) IBOutlet UIView* levelPickerView;
@property (nonatomic, retain) IBOutlet UIPickerView* pickerView;
@property (nonatomic, retain) IBOutlet UIView* pickerAccessoryView;

- (IBAction)curLevelButtonClicked:(id)sender;
- (IBAction)tarLevelButtonClicked:(id)sender;

- (IBAction)doneButtonClicked:(id)sender;

- (IBAction)resetButtonClicked:(id)sender;
- (IBAction)patentButtonClicked:(id)sender;

@end
