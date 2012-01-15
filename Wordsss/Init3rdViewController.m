//
//  Init3rdViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Init3rdViewController.h"

@implementation Init3rdViewController

@synthesize rootViewController = _rootViewController;
@synthesize loadingIndicatorImageView;

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
    //
    [super viewDidLoad];
    
    //
    [self initNavigationBar];
    
    //
    _initVirtualActor = [InitVirtualActor initVirtualActor];
    
    //
    [self showLoadingIndicator];
    
    //
    [self performSelectorInBackground:@selector(initPlan) withObject:nil];
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

#pragma mark - Instance method

- (void)runMain
{
    // Set hasInitUser Key
	[[NSUserDefaults standardUserDefaults] setBool:YES forKey:kUserDefaultKeyHasInitUser];
    
    // Init todayViewController again
    NSArray* vcArray = ((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController).viewControllers;
    [[(RKNavigationController*)[vcArray objectAtIndex:2] topViewController] viewDidLoad];
    
    // Dissmiss View
    [self dismissModalViewControllerAnimated:YES];
}

- (void)showLoadingIndicator
{
    //
    [self.loadingIndicatorImageView setHidden:NO];
    
	CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
	rotationAnimation.duration = 1.0;
	rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0];
	rotationAnimation.toValue = [NSNumber numberWithFloat:-2.0 * M_PI];
	rotationAnimation.repeatCount = 65535;
	[self.loadingIndicatorImageView.layer addAnimation:rotationAnimation forKey:@"kLoadingIndicator"];
}

- (void)hideLoadingIndicator
{
    //
    [UIView animateWithDuration:1.0
                     animations:^(void) {
                         [self.loadingIndicatorImageView setAlpha:0.0];
                     }
                     completion:^(BOOL finished) {
                         [self.loadingIndicatorImageView setHidden:YES];
                     }
     ];
}

- (void)initPlan
{
    //
    [TodayVirtualActor todayVirtualActor];
    
    //
    [self hideLoadingIndicator];
}

#pragma mark - IBAction

- (IBAction)runWordsssButtonClicked:(id)sender
{    
    [self runMain];
}

#pragma mark - RKNavigationControllerDelegate

- (void)initNavigationBar
{    
    RKNavigationController* navigationController = (RKNavigationController*)[self navigationController];
    
    [[navigationController titleLabel] setText:@""];
    [[navigationController titleImageView] setImage:nil];
    [[navigationController leftButton] setImage:[UIImage imageNamed:@"button_back.png"] forState:UIControlStateNormal];
    [[navigationController rightButton] setImage:nil forState:UIControlStateNormal];
}

- (void)navigationBarLeftButtonDown
{
    [[self navigationController] popViewControllerAnimated:YES];
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
