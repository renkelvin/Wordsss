//
//  HelpViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 2/26/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "HelpViewController.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

@synthesize scrollView, pageControl;
@synthesize sampleImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //
    [self.scrollView setContentSize:CGSizeMake(960, 460)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.sampleImageView setHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.sampleImageView setHidden:YES];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^(void){}];
    
    NSArray* vcArray = ((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController).viewControllers;
    TodayViewControllerV3* tvc = (TodayViewControllerV3*)[(UINavigationController*)[vcArray objectAtIndex:2] topViewController];
    [tvc setIsShowHelpAfterInit:[NSNumber numberWithBool:NO]];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int x = self.scrollView.contentOffset.x;
    
    if (x < 160) {
        [self.pageControl setCurrentPage:0];
    }
    else if (160 < x && x < 160 + 320) {
        [self.pageControl setCurrentPage:1];
    }
    else if (160 + 320 < x && x < 160 + 640) {
        [self.pageControl setCurrentPage:2];
    }
}

@end
