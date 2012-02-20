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
@synthesize wordSliderLeftTapArea;
@synthesize wordSliderRightTapArea;

@synthesize wordPreLabel;
@synthesize wordCurLabel;
@synthesize wordPosLabel;

@synthesize wordPosLevelImageView, wordPosLevelLeftImageView, wordPosLevelBodyImageView, wordPosLevelRightImageView;

@synthesize briefMeaningLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // WordSlider gesture recognizer
        UIPanGestureRecognizer* recognizerCenter = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(wordSliderPanning:)];
        [[self wordSliderTouchArea] addGestureRecognizer:recognizerCenter];
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
    
    // Init rknc delegate
    [[self navigationController] setDelegate:self];
    
    // Check has init user
    if ([self checkHasInitUser]) {
        // Get todayVirtualActor
        _todayVirtualActor = [TodayVirtualActor todayVirtualActor];
        
        // Update view
        [self update];
    }
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
        //        self.wordPosLabel.text = [NSString stringWithFormat:@"%@ - %@ - %@", [_todayVirtualActor wordPos].name, [[_todayVirtualActor wordRecordPos].level stringValue], [[_todayVirtualActor wordRecordPos].day stringValue]];
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
        [[_todayVirtualActor wordPos] configLabel:self.briefMeaningLabel];
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
    
    // Set wordRecord level
    [_todayVirtualActor setWordRecordCurLevelDec];
    
    // Update WordRecord
    [_todayVirtualActor updateWordRecord];
    
    // Update Word
    [_todayVirtualActor updateWord];
    
    // Update view
    [self update];
    
    NSLog(@"%@ lvl:%@ dlc:%@ dls:%@", _todayVirtualActor.wordCur.name, _todayVirtualActor.wordRecordPos.level, _todayVirtualActor.wordRecordPos.dlc, _todayVirtualActor.wordRecordPos.dls);
}

- (void)wordSliderPanning:(UIPanGestureRecognizer*)recognizer
{
    CGPoint translation = [recognizer translationInView:self.view];
    CGRect rect = [self.wordSliderImageView frame];
    
    if (recognizer.state == UIGestureRecognizerStateChanged)
    {
        rect.origin.x += translation.x;
        if(rect.origin.x > 0 && rect.origin.x < 84)
            [self.wordSliderImageView setFrame:rect];
        
        [recognizer setTranslation:CGPointZero inView:self.view];
    }
    else if(recognizer.state == UIGestureRecognizerStateEnded) 
    {
        // + operation
        if(rect.origin.x < 21)
        {
            // Move Slider
            rect.origin.x = 0;
            [self.wordSliderImageView setFrame:rect];
            
            // + operation
            
            // Move Slider
            rect.origin.x = 42;
            [self.wordSliderImageView setFrame:rect];
        }
        
        // no operation
        else if(rect.origin.x > 63)
        {
            // Move Slider
            rect.origin.x = 84;
            [self.wordSliderImageView setFrame:rect];
            
            // No operation
            
            // Move Slider
            rect.origin.x = 42;
            [self.wordSliderImageView setFrame:rect];
        }
        
        // - opration
        else 
        {
            // Move Slider
            rect.origin.x = 42;
            [self.wordSliderImageView setFrame:rect];
            
            // - operation
            
            // Move Slider
            rect.origin.x = 42;
            [self.wordSliderImageView setFrame:rect];
        }
    }
}

- (void)wordSliderLeftTap:(UITapGestureRecognizer*)recognizer
{
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider
    rect.origin.x = 0;
    [self.wordSliderImageView setFrame:rect];
    
    // + operation
    
    // Move Slider
    rect.origin.x = 42;
    [self.wordSliderImageView setFrame:rect];
}

- (void)wordSliderRightTap:(UITapGestureRecognizer*)recognizer
{
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider
    rect.origin.x = 84;
    [self.wordSliderImageView setFrame:rect];
    
    // - operation
    
    // Move Slider
    rect.origin.x = 42;
    [self.wordSliderImageView setFrame:rect];
}

- (BOOL)checkHasInitUser
{
    BOOL hasInit = [[NSUserDefaults standardUserDefaults] boolForKey:kUserDefaultKeyHasInitUser];
    
    if (!hasInit) {
        Init1stViewController* ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"Init1stViewController"];
        
        RKNavigationController* nc = [[RKNavigationController alloc] initWithRootViewController:ivc];
        
        [self presentModalViewController:nc animated:YES];
        
        return NO;
    }
    
    return YES;
}

#pragma mark - IBAction

- (IBAction)wordDetailSelected:(id)sender{
    WordViewController* wordViewController = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[_todayVirtualActor.wordPos getTargetWord] and:_todayVirtualActor.wordRecordPos];
    
    [[self navigationController] pushViewController:wordViewController animated:YES];
}

- (IBAction)wordSliderLeftTouchDown:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Right
    rect.origin.x = 166;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
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
                     }
     ];
    
    //
    [self decOperation];
}

- (IBAction)wordSliderRightTouchDown:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Left
    rect.origin.x = 102;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
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
                     }
     ];
    
    //
    [self incOperation];
}

#pragma mark - RKNavigationControllerDelegate

- (void)initNavigationBar
{    
    RKNavigationController* navigationController = (RKNavigationController*)[self navigationController];
    
    [[navigationController titleLabel] setText:@""];
    [[navigationController titleImageView] setImage:[UIImage imageNamed:@"title_small.png"]];
    [[navigationController leftButton] setImage:nil forState:UIControlStateNormal];
    [[navigationController rightButton] setImage:[UIImage imageNamed:@"button_info.png"] forState:UIControlStateNormal];
}

- (void)navigationBarLeftButtonDown
{
    
}

- (void)navigationBarRightButtonDown
{
    [self nextDay];
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [[self navigationController] setDelegate:(id<UINavigationControllerDelegate>)viewController];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self initNavigationBar];
}

@end
