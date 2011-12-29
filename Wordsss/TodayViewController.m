//
//  TodayViewController.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-2.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "TodayViewController.h"
#import "WordViewController.h"

@implementation TodayViewController

@synthesize wordSliderImageView;
@synthesize wordSliderTouchArea;
@synthesize wordSliderLeftTapArea;
@synthesize wordSliderRightTapArea;

@synthesize wordPreLabel;
@synthesize wordCurLabel;
@synthesize wordPosLabel;
@synthesize wordPosLevelImageView;
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
    
    // Check has init user
    if ([self checkHasInitUser]) {
        // Get todayVirtualActor
        _todayVirtualActor = [TodayVirtualActor todayVirtualActor];
        
        // Init rknc delegate
        [[self navigationController] setDelegate:self];
        
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

#pragma -

// update
- (void)update
{
    // 3 Word Label
    if ([_todayVirtualActor wordPre])
        self.wordPreLabel.text = [_todayVirtualActor wordPre].name;
    if ([_todayVirtualActor wordCur])
        self.wordCurLabel.text = [NSString stringWithFormat:@"%@ - %@ - %@", [_todayVirtualActor wordCur].name, [[_todayVirtualActor wordRecordCur].level stringValue], [[_todayVirtualActor wordRecordCur].day stringValue]];
    if ([_todayVirtualActor wordPos])
        self.wordPosLabel.text = [_todayVirtualActor wordPos].name;
    
    // WordPos Level Bar
    
}

- (void)nextDay
{
    [_todayVirtualActor nextDay];
}

// 
- (void)incOperation
{
    // Set wordRecord level
    [_todayVirtualActor setWordRecordCurLevelInc];
    
    // Update WordRecord
    [_todayVirtualActor updateWordRecord];
    
    // Update Word
    [_todayVirtualActor updateWord];
    
    // Update view
    [self update];
}

// 
- (void)decOperation
{
    // Set wordRecord level
    [_todayVirtualActor setWordRecordCurLevelDec];
    
    // Update WordRecord
    [_todayVirtualActor updateWordRecord];
    
    // Update Word
    [_todayVirtualActor updateWord];
    
    // Update view
    [self update];
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

- (BOOL)check1stTimeLogIn
{
    // TODO
    int count = [[NSUserDefaults standardUserDefaults] integerForKey:kUserDefaultKeyLoginCount];
    
    if (count == 0) {
        Init1stViewController* ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"Init1stViewController"];

        RKNavigationController* nc = [[RKNavigationController alloc] initWithRootViewController:ivc];

        [self presentModalViewController:nc animated:YES];
        
        return YES;
    }    
    
    return NO;
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

#pragma - IBAction

- (IBAction)wordDetailSelected:(id)sender{
    WordViewController* wordViewController = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:_todayVirtualActor.wordPos];
    
    [[self navigationController] pushViewController:wordViewController animated:YES];
}

- (IBAction)wordSliderLeftTouchDown:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Right
    rect.origin.x = 84;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
                     }
     ];
}

- (IBAction)wordSliderLeftTouchUpInside:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Center
    rect.origin.x = 42;
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
    rect.origin.x = 0;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
                     }
     ];
}

- (IBAction)wordSliderRightTouchUpInside:(id)sender {
    CGRect rect = [self.wordSliderImageView frame];
    
    // Move Slider to Center
    rect.origin.x = 42;
    [UIView animateWithDuration:0.1
                     animations:^(void){
                         [self.wordSliderImageView setFrame:rect];
                     }
     ];
    
    //
    [self incOperation];
}

#pragma - RKNavigationControllerDelegate

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

#pragma - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [[self navigationController] setDelegate:(id<UINavigationControllerDelegate>)viewController];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self initNavigationBar];
}

@end
