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

- (void)getVA
{
    //
    [UserVirtualActor userVirtualActor];
    [WordsssDBVirtualActor wordsssDBVirtualActor];
}

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
    [self performSelectorInBackground:@selector(getVA) withObject:nil];
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
            bodyWidth = 311;
        }
        else {
            bodyWidth = 311 / 11.0 * [[_todayVirtualActor wordRecordPos].level intValue];
        }
        
        CGRect frame;
        
        frame = self.wordPosLevelBodyImageView.frame;
        frame.size.width = bodyWidth;
        self.wordPosLevelBodyImageView.frame = frame;
        
        frame = self.wordPosLevelRightImageView.frame;
        frame.origin.x = 2 + bodyWidth + 1;
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
            bodyWidth = 311;
        }
        else {
            bodyWidth = 311 / 11.0 * [[_todayVirtualActor wordRecordPos].level intValue];
        }
        
        CGRect frame;
        
        frame = self.wordPosLevelBodyTransImageView.frame;
        frame.size.width = bodyWidth;
        self.wordPosLevelBodyTransImageView.frame = frame;
        
        frame = self.wordPosLevelRightTransImageView.frame;
        frame.origin.x = 2 + bodyWidth + 1;
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

- (IBAction)wordSliderLeftTouchUpInside:(id)sender {
    //
    [self decOperation];
}

- (IBAction)wordSliderRightTouchUpInside:(id)sender {
    //
    [self incOperation];
}

- (IBAction)helpButtonClicked:(id)sender
{
    HelpViewController* hvc = [self.storyboard instantiateViewControllerWithIdentifier:@"HelpViewController"];
    
    [((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController) presentModalViewController:hvc animated:NO];
}

@end
