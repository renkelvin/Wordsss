//
//  SettingViewController.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-3.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKNavigationController.h"
#import "RKNavigationControllerDelegate.h"

#import "SettingVirtualActor.h"

#import "Defult.h"

#define kPickerViewFrameHide CGRectMake(0, 367, 320, 216)
#define kPickerViewFrameShow CGRectMake(0, 151, 320, 216)

@interface SettingViewController : UIViewController <RKNavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
{
    SettingVirtualActor* _settingVirtualActor;
}

@property (nonatomic, retain) IBOutlet UITextField* nameTextField;
@property (nonatomic, retain) IBOutlet UIPickerView* pickerView;

@end
