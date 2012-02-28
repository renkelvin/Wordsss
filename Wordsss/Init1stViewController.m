//
//  Init1stViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Init1stViewController.h"

@implementation Init1stViewController

@synthesize nameTextField;

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
    
    // Init rknc delegate
    [[self navigationController] setDelegate:self];
    [[[self navigationController] navigationBar] setBackgroundImage:[UIImage imageNamed:@"topbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    
    //
    _initVirtualActor = [InitVirtualActor initVirtualActor];
    
    //
    [self.nameTextField becomeFirstResponder];
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

- (void)setNickname
{
    NSString* nameString = [self.nameTextField text];
    
    [_initVirtualActor.user.profile setNickname:nameString];
}

- (IBAction)nextStep
{    
    //
    NSString* nameString = [self.nameTextField text];
    if ([nameString compare:@""] == NSOrderedSame) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }   
    else {
        //
        [self.nameTextField resignFirstResponder];
        
        //
        [self setNickname];
        
        //
        Init2ndViewController* ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"Init2ndViewController"];
        [[self navigationController] pushViewController:ivc animated:YES];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //
    [textField resignFirstResponder];
    
    return YES;
}

@end
