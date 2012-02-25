//
//  TodayViewControllerV2.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-2.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "WordsssAppDelegate.h"
#import "Init1stViewController.h"

#import "TodayVirtualActor.h"

#import "Word_Dict.h"
#import "McecDictWord.h"
#import "McecDictMeaning.h"

#import "WordCellLabel.h"

#define kPreTransPositionBeg CGRectMake(0, 223, 320, 129);
#define kPreTransPositionEnd CGRectMake(0, 133, 320, 129);
#define kPosTransPositionBeg CGRectMake(0, 122, 320, 122);
#define kPosTransPositionEnd CGRectMake(0, 0, 320, 122);
#define kCurTransPositionBeg CGRectMake(20, 135, 280, 37);
#define kCurTransPositionEnd CGRectMake(20, 20, 280, 37);

@interface TodayViewControllerV2 : UIViewController <UINavigationControllerDelegate>
{
    //
    TodayVirtualActor* _todayVirtualActor;
    
    //
    BOOL ifDec;
}

#pragma mark - property

@property (nonatomic, retain) IBOutlet UIView* preTransView;
@property (nonatomic, retain) IBOutlet UIView* posTransView;

@property (nonatomic, retain) IBOutlet UIImageView* wordSliderImageView;
@property (nonatomic, retain) IBOutlet UIView* wordSliderTouchArea;

@property (nonatomic, retain) IBOutlet UILabel* wordPreLabel;
@property (nonatomic, retain) IBOutlet UILabel* wordCurLabel;
@property (nonatomic, retain) IBOutlet UILabel* wordPosLabel;

@property (nonatomic, retain) IBOutlet UIImageView* forgetImageView;
@property (nonatomic, retain) IBOutlet UIImageView* confirmImageView;

@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelLeftImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelBodyImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelRightImageView;

@property (nonatomic, retain) IBOutlet UIButton* briefMeaningButton;
@property (nonatomic, retain) IBOutlet WordCellLabel* briefMeaningLabelT;
@property (nonatomic, retain) IBOutlet WordCellLabel* briefMeaningLabelM;

@property (nonatomic, retain) IBOutlet UILabel* wordPreTransLabel;
@property (nonatomic, retain) IBOutlet UILabel* wordCurTransLabel;
@property (nonatomic, retain) IBOutlet UILabel* wordPosTransLabel;

@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelTransImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelLeftTransImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelBodyTransImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelRightTransImageView;

@property (nonatomic, retain) IBOutlet UIButton* briefMeaningTransButton;
@property (nonatomic, retain) IBOutlet WordCellLabel* briefMeaningTransLabelT;
@property (nonatomic, retain) IBOutlet WordCellLabel* briefMeaningTransLabelM;


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
