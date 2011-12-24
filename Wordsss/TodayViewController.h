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

#import "TodayVirtualActor.h"

#import "Word_Dict.h"
#import "McecDictWord.h"
#import "McecDictMeaning.h"

@interface TodayViewController : UIViewController <RKNavigationControllerDelegate, UINavigationControllerDelegate>
{
    //
    TodayVirtualActor* _todayVirtualActor;
    
    //
    UILabel* _wordLabelPre;
    UILabel* _wordLabelCur;
    UILabel* _wordLabelPos;
    
    UILabel* _briefMeaningLabel;
}

#pragma mark - property

@property (nonatomic, retain) IBOutlet UIImageView* wordSliderImageView;
@property (nonatomic, retain) IBOutlet UIView* wordSliderTouchArea;
@property (nonatomic, retain) IBOutlet UIView* wordSliderLeftTapArea;
@property (nonatomic, retain) IBOutlet UIView* wordSliderRightTapArea;

@property (nonatomic, retain) IBOutlet UILabel* wordLabelPre;
@property (nonatomic, retain) IBOutlet UILabel* wordLabelCur;
@property (nonatomic, retain) IBOutlet UILabel* wordLabelPos;

@property (nonatomic, retain) IBOutlet UILabel* briefMeaningLabel;

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

- (void)update;

- (void)nextDay;

@end
