//
//  TodayViewController.h
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

#import "WordCellBrief.h"

@interface TodayViewController : UIViewController <RKNavigationControllerDelegate, UINavigationControllerDelegate>
{
    //
    TodayVirtualActor* _todayVirtualActor;
}

#pragma mark - property

@property (nonatomic, retain) IBOutlet UIImageView* wordSliderImageView;
@property (nonatomic, retain) IBOutlet UIView* wordSliderTouchArea;
@property (nonatomic, retain) IBOutlet UIView* wordSliderLeftTapArea;
@property (nonatomic, retain) IBOutlet UIView* wordSliderRightTapArea;

@property (nonatomic, retain) IBOutlet UILabel* wordPreLabel;
@property (nonatomic, retain) IBOutlet UILabel* wordCurLabel;
@property (nonatomic, retain) IBOutlet UILabel* wordPosLabel;

@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelLeftImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelBodyImageView;
@property (nonatomic, retain) IBOutlet UIImageView* wordPosLevelRightImageView;

@property (nonatomic, retain) IBOutlet WordCellBrief* briefMeaningLabel;

#pragma mark - IBAction

- (IBAction)wordDetailSelected:(id)sender;
- (IBAction)wordSliderLeftTouchDown:(id)sender;
- (IBAction)wordSliderLeftTouchUpInside:(id)sender;
- (IBAction)wordSliderRightTouchDown:(id)sender;
- (IBAction)wordSliderRightTouchUpInside:(id)sender;

#pragma mark - Instance method

- (void)wordSliderPanning:(UIPanGestureRecognizer*)recognizer;
- (void)wordSliderLeftTap:(UITapGestureRecognizer*)recognizer;
- (void)wordSliderRightTap:(UITapGestureRecognizer*)recognizer;

- (BOOL)checkHasInitUser;

- (void)update;

- (void)nextDay;

@end
