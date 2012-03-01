//
//  TodayViewControllerV3.m
//  Wordsss
//
//  Created by Ren Chuan on 2/28/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "TodayViewControllerV3.h"
#import "WordViewController.h"

@implementation TodayViewControllerV3

@synthesize posTransView;

@synthesize wordPosCoverView;

@synthesize wordCurLabel, wordPosLabel;
@synthesize wordPosLevelImageView, wordPosLevelLeftImageView, wordPosLevelBodyImageView, wordPosLevelRightImageView;
@synthesize briefMeaningButton, briefMeaningLabelT, briefMeaningLabelM;

@synthesize wordCurTransLabel, wordPosTransLabel;
@synthesize wordPosLevelTransImageView, wordPosLevelLeftTransImageView, wordPosLevelBodyTransImageView, wordPosLevelRightTransImageView;
@synthesize briefMeaningTransButton, briefMeaningTransLabelT, briefMeaningTransLabelM;

@synthesize infoLeftGraphView, infoRightGraphView;
@synthesize infoLeftNowLabel, infoLeftSumLabel, infoRightNowLabel, infoRightSumLabel;

@synthesize dkhlImageView, knowhlImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
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
    if ([_todayVirtualActor wordCur]) {
        self.wordCurLabel.text = [_todayVirtualActor wordCur].name;
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
            bodyWidth = 313;
        }
        else {
            bodyWidth = 313 / 11.0 * [[_todayVirtualActor wordRecordPos].level intValue];
        }
        
        CGRect frame;
        
        frame = self.wordPosLevelBodyImageView.frame;
        frame.size.width = bodyWidth;
        self.wordPosLevelBodyImageView.frame = frame;
        
        frame = self.wordPosLevelRightImageView.frame;
        frame.origin.x = 1 + bodyWidth + 2;
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
    
    // info
    // View
    int viewSum = 300;
    [self.infoLeftSumLabel setText:[NSString stringWithFormat:@"%d", viewSum]];
    int viewNow = [_todayVirtualActor.user.status.dlc intValue];
    [self.infoLeftNowLabel setText:[NSString stringWithFormat:@"%d", viewNow]];
    
    [self.infoLeftGraphView setType:LEFT];
    [self.infoLeftGraphView setPercent:[NSNumber numberWithFloat:((float)viewNow/(float)viewSum)]];
    [self.infoLeftGraphView setNeedsDisplay];
    
    //
    int wordSum = [_todayVirtualActor.todayWordSum intValue];
    [self.infoRightSumLabel setText:[NSString stringWithFormat:@"%d", wordSum - 20]];
    int wordNow = [_todayVirtualActor.wordRecordSet count];
    [self.infoRightNowLabel setText:[NSString stringWithFormat:@"%d", wordSum - wordNow]];
    
    [self.infoRightGraphView setType:RIGHT];
    [self.infoRightGraphView setPercent:[NSNumber numberWithFloat:((float)(wordSum - wordNow)/(float)(wordSum - 20))]];
    [self.infoRightGraphView setNeedsDisplay];
}

// update trans
- (void)updateTrans
{
    // 3 Word Label
    if ([_todayVirtualActor wordCur]) {
        self.wordCurLabel.text = [_todayVirtualActor wordCur].name;
    }
    if ([_todayVirtualActor wordPos]) {
        self.wordCurTransLabel.text = [_todayVirtualActor wordPos].name;
    }
    if ([_todayVirtualActor wordPos]) {
        self.wordPosTransLabel.text = [_todayVirtualActor wordPos].name;
    }
    
    // WordPos Level Bar
    if ([_todayVirtualActor wordPos]) {
        [self.wordPosLevelLeftTransImageView setHidden:NO];
        [self.wordPosLevelBodyTransImageView setHidden:NO];
        [self.wordPosLevelRightTransImageView setHidden:NO];
        
        int bodyWidth = 0;
        
        if ([[_todayVirtualActor wordRecordPos].level intValue] == -1) {
            bodyWidth = 313;
        }
        else {
            bodyWidth = 313 / 11.0 * [[_todayVirtualActor wordRecordPos].level intValue];
        }
        
        CGRect frame;
        
        frame = self.wordPosLevelBodyTransImageView.frame;
        frame.size.width = bodyWidth;
        self.wordPosLevelBodyTransImageView.frame = frame;
        
        frame = self.wordPosLevelRightTransImageView.frame;
        frame.origin.x = 1 + bodyWidth + 2;
        self.wordPosLevelRightTransImageView.frame = frame;
    }
    
    // WordPos Brief Meaning
    if ([_todayVirtualActor wordPos]) {
        [[_todayVirtualActor wordPos] configLabel:self.briefMeaningTransLabelT label:self.briefMeaningTransLabelM];
    }
    
    //
    if (ifDec) {
        [self.briefMeaningTransButton setSelected:YES];
    }
    else {
        [self.briefMeaningTransButton setSelected:NO];
    }
}

- (void)nextDay
{
    [_todayVirtualActor nextDay];
}

- (void)animate
{
    //
    CGRect posFrame = kPosTransPositionBeg;
    [self.posTransView setFrame:posFrame];
    
    CGRect curFrame = kCurTransPositionBeg;
    [self.wordCurTransLabel setFrame:curFrame];
    [self.wordCurTransLabel setAlpha:1.0];
    
    [self.wordCurLabel setAlpha:0.0];
    
    [self.wordPosCoverView setAlpha:0.0];
    
    [self.wordPosCoverView setHidden:NO];
    //
    [UIView animateWithDuration:0.5 animations:^(void)
     {
         CGRect posFrame = kPosTransPositionEnd;
         [self.posTransView setFrame:posFrame];
         
         [self.wordCurLabel setAlpha:1.0];
         
         [self.wordPosCoverView setAlpha:1.0];
     } completion:^(BOOL finished){
         // Update view
         [self update];
     }];
    
    //
    [UIView animateWithDuration:0.3 animations:^(void)
     {
         CGRect curFrame = kCurTransPositionEnd;
         [self.wordCurTransLabel setFrame:curFrame];
         [self.wordCurTransLabel setAlpha:0.0];
     }];
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
    
    // Update trans view
    [self updateTrans];
    
    //
    [self animate];
    
    // Update view
    //    [self update];
    
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
    
    // Update trans view
    [self updateTrans];
    
    //
    [self animate];
    
    // Update view
    //    [self update];
    
    NSLog(@"%@ lvl:%@ dlc:%@ dls:%@", _todayVirtualActor.wordPos.name, _todayVirtualActor.wordRecordPos.level, _todayVirtualActor.wordRecordPos.dlc, _todayVirtualActor.wordRecordPos.dls);
}

//
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
    //
    [UIView animateWithDuration:kAnimationInterval animations:^(void){
        [self.dkhlImageView setAlpha:1.0];
    }];
}

- (IBAction)wordSliderRightTouchDown:(id)sender {
    //
    [UIView animateWithDuration:kAnimationInterval animations:^(void){
        [self.knowhlImageView setAlpha:1.0];
    }];
}

- (IBAction)wordSliderLeftTouchUpInside:(id)sender {
    //
    [self decOperation];
    
    //
    [UIView animateWithDuration:kAnimationInterval animations:^(void){
        [self.dkhlImageView setAlpha:0.0];
    }];
}

- (IBAction)wordSliderRightTouchUpInside:(id)sender {
    //
    [self incOperation];
    
    //
    [UIView animateWithDuration:kAnimationInterval animations:^(void){
        [self.knowhlImageView setAlpha:0.0];
    }];
}

- (IBAction)wordSliderLeftTouchUpOutside:(id)sender {
    //
    [UIView animateWithDuration:kAnimationInterval animations:^(void){
        [self.dkhlImageView setAlpha:0.0];
    }];
}

- (IBAction)wordSliderRightTouchUpOutside:(id)sender {
    //
    [UIView animateWithDuration:kAnimationInterval animations:^(void){
        [self.knowhlImageView setAlpha:0.0];
    }];
}

- (IBAction)wordSliderLeftTouchDragEnter:(id)sender
{
    //
    [UIView animateWithDuration:kAnimationInterval animations:^(void){
        [self.dkhlImageView setAlpha:1.0];
    }];
}

- (IBAction)wordSliderRightTouchDragEnter:(id)sender
{
    //
    [UIView animateWithDuration:kAnimationInterval animations:^(void){
        [self.knowhlImageView setAlpha:1.0];
    }];
}

- (IBAction)wordSliderLeftTouchDragExit:(id)sender
{
    //
    [UIView animateWithDuration:kAnimationInterval animations:^(void){
        [self.dkhlImageView setAlpha:0.0];
    }];
}

- (IBAction)wordSliderRightTouchDragExit:(id)sender
{
    //
    [UIView animateWithDuration:kAnimationInterval animations:^(void){
        [self.knowhlImageView setAlpha:0.0];
    }];
}

- (IBAction)helpButtonClicked:(id)sender
{
    HelpViewController* hvc = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpViewController"];
    
    [((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController) presentModalViewController:hvc animated:NO];
}

@end
