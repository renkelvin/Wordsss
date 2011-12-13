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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    //
    [[self navigationController] setDelegate:self];
    
    // WordSlider gesture recognizer
    UIPanGestureRecognizer* recognizerCenter = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(wordSliderPanning:)];
    [[self wordSliderTouchArea] addGestureRecognizer:recognizerCenter];
    
    //    UITapGestureRecognizer* recognizerLeft = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wordSliderLeftTap:)];
    //    [[self wordSliderLeftTapArea] addGestureRecognizer:recognizerLeft];
    //    
    //    UITapGestureRecognizer* recognizerRight = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wordSliderRightTap:)];
    //    [[self wordSliderRightTapArea] addGestureRecognizer:recognizerRight];
    
    //
    _todayVirtualActor = [TodayVirtualActor todayVirtualActor];
    _userVirtualActor = [UserVirtualActor userVirtualActor];
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

#pragma - IBAction

- (IBAction)wordDetailSelected:(id)sender
{
    WordViewController* wordViewController = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] initSectionViewControllers];
    
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
}

#pragma -

// 
- (void)incOperation
{
    // Set wordRecord
    [_userVirtualActor setWordRecordCurLevelInc];
    
    // Update UserVirtualActor WordRecord
    [_userVirtualActor updateWordRecordCur];
 
    // Update TodayVirtualActor Word
    NSNumber* word_id = [[_userVirtualActor wordRecordCur] word_id];
    [_todayVirtualActor updateWordWithWordId:word_id];
    
    // Update view
}

// 
- (void)decOperation
{
    
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
