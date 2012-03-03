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

- (void)viewWillAppear:(BOOL)animated
{
//    [self.view setAlpha:0.0];
}

- (void)viewDidAppear:(BOOL)animated
{
//    [UIView animateWithDuration:0.6 animations:^(void){
//        [self.view setAlpha:1.0];
//    }];
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
    [UIView animateWithDuration:0.3 
                     animations:^(void){
                         [self.view setAlpha:0.0];
                     } 
                     completion:^(BOOL finished){
                         [self dismissModalViewControllerAnimated:NO];
                     }
     ];
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
