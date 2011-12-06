//
//  SettingViewController.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-3.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "SettingViewController.h"

@implementation SettingViewController

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
    
    [self initNavigationBar];
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

#pragma - RKNavigationControllerDelegate

- (void)initNavigationBar
{    
    RKNavigationController* navigationController = (RKNavigationController*)[self navigationController];

    [[navigationController titleLabel] setText:@"设置"];
    [[navigationController titleImageView] setImage:nil];
    [[navigationController leftButton] setImage:nil forState:UIControlStateNormal];
    [[navigationController rightButton] setImage:nil forState:UIControlStateNormal];
}

- (void)navigationBarLeftButtonDown
{
    
}

- (void)navigationBarRightButtonDown
{
    
}

@end
