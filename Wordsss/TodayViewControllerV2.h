//
//  TodayViewControllerV2.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-2.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "RKNavigationController.h"
#import "RKNavigationControllerDelegate.h"

#import "WordsssAppDelegate.h"
#import "Init1stViewController.h"

#import "TodayVirtualActor.h"

#import "Word_Dict.h"
#import "McecDictWord.h"
#import "McecDictMeaning.h"

#import "WordCellLabel.h"

@interface TodayViewControllerV2 : UIViewController <RKNavigationControllerDelegate, UINavigationControllerDelegate>
{
    //
    TodayVirtualActor* _todayVirtualActor;
}

#pragma mark - property

@property (nonatomic, retain) IBOutlet UIImageView* wordSliderImageView;
@property (nonatomic, retain) IBOutlet UIView* wordSliderTouchArea;

@property (nonatomic, retain) IBOutlet UILabel* wordPreLabel;
@property (nonatomic, retain) IBOutlet UILabel* wordCurLabel;
@property (nonatomic, retain) IBOutlet UILabel* wordPosLabel;

@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelLeftImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelBodyImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelRightImageView;

@property (nonatomic, retain) IBOutlet WordCellLabel* briefMeaningLabelT;
@property (nonatomic, retain) IBOutlet WordCellLabel* briefMeaningLabelM;

#pragma mark - IBAction

- (IBAction)wordDetailSelected:(id)sender;
- (IBAction)wordSliderLeftTouchDown:(id)sender;
- (IBAction)wordSliderLeftTouchUpInside:(id)sender;
- (IBAction)wordSliderLeftTouchUpOutside:(id)sender;
- (IBAction)wordSliderRightTouchDown:(id)sender;
- (IBAction)wordSliderRightTouchUpInside:(id)sender;
- (IBAction)wordSliderRightTouchUpOutside:(id)sender;

#pragma mark - Instance method

- (IBAction)wordSliderPanning:(UIPanGestureRecognizer*)recognizer;

- (BOOL)checkHasInitUser;

- (void)update;

- (void)nextDay;

@end
