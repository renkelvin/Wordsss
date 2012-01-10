//
//  Init2ndViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Init2ndViewController.h"

@implementation Init2ndViewController

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

- (void)setCurrentLevel
{
    //
    [_initVirtualActor.user.defult setCurrentLevel:[NSNumber numberWithInt:VLCET4]];
}

- (void)setTargetLevel
{
    //
    [_initVirtualActor.user.defult setTargetLevel:[NSNumber numberWithInt:VLGRE]];    
}

- (void)nextStep
{
    [self setCurrentLevel];
    [self setTargetLevel];
    
    Init3rdViewController* ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"Init3rdViewController"];
    
    [[self navigationController] pushViewController:ivc animated:YES];
}

#pragma mark - RKNavigationControllerDelegate

- (void)initNavigationBar
{    
    RKNavigationController* navigationController = (RKNavigationController*)[self navigationController];
    
    [[navigationController titleLabel] setText:@""];
    [[navigationController titleImageView] setImage:nil];
    [[navigationController leftButton] setImage:[UIImage imageNamed:@"button_back.png"] forState:UIControlStateNormal];
    [[navigationController rightButton] setImage:[UIImage imageNamed:@"button_next.png"] forState:UIControlStateNormal];
}

- (void)navigationBarLeftButtonDown
{
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)navigationBarRightButtonDown
{
    [self nextStep];    
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

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString* string = [NSString string];
    
    switch (row) {
        case 0:
            string = @"0";
            break;
        case 1:
            string = @"1";
            break;
        case 2:
            string = @"2";
            break;
        case 3:
            string = @"3";
            break;
        case 4:
            string = @"4";
            break;
        case 5:
            string = @"5";
            break;
        case 6:
            string = @"6";
            break;
        case 7:
            string = @"7";
            break;
        case 8:
            string = @"8";
            break;
        case 9:
            string = @"9";
            break;
        default:
            break;
    }
    
    return string;
}

#pragma mark - UIPickerViewDatasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

@end
