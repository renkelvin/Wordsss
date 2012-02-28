//
//  TodayViewControllerV3.h
//  Wordsss
//
//  Created by Ren Chuan on 2/28/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "WordsssAppDelegate.h"
#import "Init1stViewController.h"
#import "HelpViewController.h"
#import "RKTabBarController.h"

#import "TodayVirtualActor.h"
#import "UserVirtualActor.h"
#import "WordsssDBVirtualActor.h"

#import "Word_Dict.h"
#import "McecDictWord.h"
#import "McecDictMeaning.h"

#import "WordCellLabel.h"

#define kPreTransPositionBeg CGRectMake(0, 223, 320, 129);
#define kPreTransPositionEnd CGRectMake(0, 113, 320, 129);
#define kPosTransPositionBeg CGRectMake(0, 122, 320, 122);
#define kPosTransPositionEnd CGRectMake(0, 0, 320, 122);
#define kCurTransPositionBeg CGRectMake(20, 11, 280, 37);
#define kCurTransPositionEnd CGRectMake(20, -9, 280, 37);

@interface TodayViewControllerV3 : UIViewController <UINavigationControllerDelegate>
{
    //
    TodayVirtualActor* _todayVirtualActor;
    
    //
    BOOL ifDec;
}

#pragma mark - property

@property (nonatomic, retain) IBOutlet UIView* posTransView;

@property (nonatomic, retain) IBOutlet UILabel* wordCurLabel;
@property (nonatomic, retain) IBOutlet UILabel* wordPosLabel;

@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelLeftImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelBodyImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelRightImageView;

@property (nonatomic, retain) IBOutlet UIButton* briefMeaningButton;
@property (nonatomic, retain) IBOutlet WordCellLabel* briefMeaningLabelT;
@property (nonatomic, retain) IBOutlet WordCellLabel* briefMeaningLabelM;

@property (nonatomic, retain) IBOutlet UILabel* wordCurTransLabel;
@property (nonatomic, retain) IBOutlet UILabel* wordPosTransLabel;

@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelTransImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelLeftTransImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelBodyTransImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelRightTransImageView;

@property (nonatomic, retain) IBOutlet UIButton* briefMeaningTransButton;
@property (nonatomic, retain) IBOutlet WordCellLabel* briefMeaningTransLabelT;
@property (nonatomic, retain) IBOutlet WordCellLabel* briefMeaningTransLabelM;

@property (nonatomic, retain) IBOutlet UIView* wordPosCoverView;

#pragma mark - IBAction

- (IBAction)wordDetailSelected:(id)sender;
- (IBAction)wordSliderLeftTouchUpInside:(id)sender;
- (IBAction)wordSliderRightTouchUpInside:(id)sender;

- (IBAction)helpButtonClicked:(id)sender;

#pragma mark - Instance method

- (BOOL)checkHasInitUser;

- (void)update;

- (void)nextDay;

@end
