//
//  TodayViewControllerV2.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-2.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "TodayViewControllerV2.h"
#import "WordViewController.h"

@implementation TodayViewControllerV2

@synthesize wordSliderImageView;
@synthesize wordSliderTouchArea;

@synthesize forgetImageView, confirmImageView;

@synthesize wordPreLabel, wordCurLabel, wordPosLabel;

@synthesize wordPosLevelImageView, wordPosLevelLeftImageView, wordPosLevelBodyImageView, wordPosLevelRightImageView;

@synthesize briefMeaningButton, briefMeaningLabelT, briefMeaningLabelM;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // WordSlider gesture recognizer
        //        UIPanGestureRecognizer* recognizerCenter = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(wordSliderPanning:)];
        //        [[self wordSliderTouchArea] addGestureRecognizer:recognizerCenter];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];    
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Check has init user
    if ([self checkHasInitUser]) {
        // Get todayVirtualActor
        _todayVirtualActor = [TodayVirtualActor todayVirtualActor];
        
        // Update view
        [self update];
    }
    
    //
    [UserVirtualActor userVirtualActor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[[self navigationController] navigationBar] setBackgroundImage:[UIImage imageNamed:@"mainbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -

// update
- (void)update
{
    // 3 Word Label
    if ([_todayVirtualActor wordPre]) {
        self.wordPreLabel.text = [_todayVirtualActor wordPre].name;
    }
    if ([_todayVirtualActor wordCur]) {
        self.wordCurLabel.text = [NSString stringWithFormat:@"%@", [_todayVirtualActor wordCur].name, [[_todayVirtualActor wordRecordCur].level stringValue], [[_todayVirtualActor wordRecordCur].day stringValue]];
    }
    if ([_todayVirtualActor wordPos]) {
        self.wordPosLabel.text = [_todayVirtualActor wordPos].name;
    }
    
    // WordPos Level Bar
    if ([_todayVirtualActor wordPos]) {
        [self.wordPosLevelLeftImageView setHidden:NO];
        [self.wordPosLevelBodyImageView setHidden:NO];
        [self.wordPosLevelRightImageView setHidden:NO];
        
        int bodyWidth = 0;
        
        if ([[_todayVirtualActor wordRecordPos].level intValue] == -1) {
            bodyWidth = 281;
        }
        else {
            bodyWidth = 281 / 11.0 * [[_todayVirtualActor wordRecordPos].level intValue];
        }
        
        CGRect frame;
        
        frame = self.wordPosLevelBodyImageView.frame;
        frame.size.width = bodyWidth;
        self.wordPosLevelBodyImageView.frame = frame;
        
        frame = self.wordPosLevelRightImageView.frame;
        frame.origin.x = 20 + bodyWidth - 1;
        self.wordPosLevelRightImageView.frame = frame;
    }
    
    // WordPos Brief Meaning
    if ([_todayVirtualActor wordPos]) {
        [[_todayVirtualActor wordPos] configLabel:self.briefMeaningLabelT label:self.briefMeaningLabelM];
    }
    
    //
    if (ifDec) {
        [self.briefMeaningButton setSelected:YES];
    }
    else {
        [self.briefMeaningButton setSelected:NO];
    }
}

- (void)nextDay
{
    [_todayVirtualActor nextDay];
}

// 
- (void)incOperation
{
    NSLog(@"%@ lvl:%@ dlc:%@ dls:%@", _todayVirtualActor.wordCur.name, _todayVirtualActor.wordRecordCur.level, _todayVirtualActor.wordRecordCur.dlc, _todayVirtualActor.wordRecordCur.dls);
    
    ifDec = NO;
    
    // Set wordRecord level
    [_todayVirtualActor setWordRecordCurLevelInc];
    
    // Update WordRecord
    [_todayVirtualActor updateWordRecord];
    
    // Update Word
    [_todayVirtualActor updateWord];
    
    // Update view
    [self update];
    
    NSLog(@"%@ lvl:%@ dlc:%@ dls:%@", _todayVirtualActor.wordPos.name, _todayVirtualActor.wordRecordPos.level, _todayVirtualActor.wordRecordPos.dlc, _todayVirtualActor.wordRecordPos.dls);
}

// 
- (void)decOperation
{
    NSLog(@"%@ lvl:%@ dlc:%@ dls:%@", _todayVirtualActor.wordCur.name, _todayVirtualActor.wordRecordCur.level, _todayVirtualActor.wordRecordCur.dlc, _todayVirtualActor.wordRecordCur.dls);
    
    ifDec = YES;
    
    // Set wordRecord level
    [_todayVirtualActor setWordRecordCurLevelDec];
    
    // Update WordRecord
    [_todayVirtualActor updateWordRecord];
    
    // Update Word
    [_todayVirtualActor updateWord];
    
    // Update view
    [self update];
    
    NSLog(@"%@ lvl:%@ dlc:%@ dls:%@", _todayVirtualActor.wordPos.name, _todayVirtualActor.wordRecordPos.level, _todayVirtualActor.wordRecordPos.dlc, _todayVirtualActor.wordRecordPos.dls);
}

- (IBAction)wordSliderPanning:(UIPanGestureRecognizer*)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    CGRect rect = [self.wordSliderImageView frame];
    
    if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        rect.origin.x += translation.x;
        if (rect.origin.x >= 102 && rect.origin.x <= 166) {
            [self.wordSliderImageView setFrame:rect];
            
            if (rect.origin.x < 134) {
                [self.forgetImageView setAlpha:(134-rect.origin.x)/32.0];
            }
            else if (rect.origin.x > 134) {
                [self.confirmImageView setAlpha:(rect.origin.x-134)/32.0];
            }
        }
        
        [recognizer setTranslation:CGPointZero inView:self.view];
    }
    else if(recognizer.state == UIGestureRecognizerStateEnded) 
    {
        // - operation
        if(rect.origin.x < 118)
        {            
            // - operation
            [self decOperation];
            
            // Move Slider
            rect.origin.x = 134;
            [UIView animateWithDuration:0.1
                             animations:^(void){
                                 [self.wordSliderImageView setFrame:rect];
                                 [self.confirmImageView setAlpha:0.0];
                                 [self.forgetImageView setAlpha:0.0];
                             }
             ];
        }
        
        // + operation
        else if(rect.origin.x > 150)
        {
            // + operation
            [self incOperation];
            
            // Move Slider
            rect.origin.x = 134;
            [UIView animateWithDuration:0.1
                             animations:^(void){
                                 [self.wordSliderImageView setFrame:rect];
                                 [self.confirmImageView setAlpha:0.0];
                                 [self.forgetImageView setAlpha:0.0];
                             }
             ];
        }
        
        // no opration
        else 
        {
            // no operation
            
            // Move Slider
            rect.origin.x = 134;
            [UIView animateWithDuration:0.1
                             animations:^(void){
                                 [self.wordSliderImageView setFrame:rect];
                                 [self.confirmImageView setAlpha:0.0];
                                 [self.forgetImageView setAlpha:0.0];
                             }
             ];
        }
    }
}

- (BOOL)checkHasInitUser
{
    BOOL hasInit = [[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultKeyHasInitUser];
    
    if (!hasInit) {
        Init1stViewController* ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"Init1stViewController"];
        
        UINavigationController* nc = [[UINavigationController alloc] initWithRootViewController:ivc];
        
        [self presentModalViewController:nc animated:YES];
        
        return NO;
    }
    
    return YES;
}

#pragma mark - IBAction

- (IBAction)wordDetailSelected:(id)sender{
    WordViewController* wordViewController = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[_todayVirtualActor.wordPos getTargetWord]];
    
    [[self navigationController] pushViewController:wordViewController animated:YES];
}

- (IBAction)wordSliderLeftTouchDown:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Right
    rect.origin.x = 102;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
                         [self.forgetImageView setAlpha:1.0];
                     }
     ];
}

- (IBAction)wordSliderLeftTouchUpInside:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Center
    rect.origin.x = 134;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
                         [self.forgetImageView setAlpha:0.0];
                     }
     ];
    
    //
    [self decOperation];
}

- (IBAction)wordSliderLeftTouchUpOutside:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Center
    rect.origin.x = 134;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
                         [self.forgetImageView setAlpha:0.0];
                     }
     ];
    
    //
    //    [self decOperation];
}

- (IBAction)wordSliderRightTouchDown:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Left
    rect.origin.x = 166;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
                         [self.confirmImageView setAlpha:1.0];
                     }
     ];
}

- (IBAction)wordSliderRightTouchUpInside:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Center
    rect.origin.x = 134;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
                         [self.confirmImageView setAlpha:0.0];
                     }
     ];
    
    //
    [self incOperation];
}

- (IBAction)wordSliderRightTouchUpOutside:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Center
    rect.origin.x = 134;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
                         [self.confirmImageView setAlpha:0.0];
                     }
     ];
    
    //
    //    [self incOperation];
}

@end
