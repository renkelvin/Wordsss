//
//  SettingViewController.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-3.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "SettingViewController.h"

static char* nameArray[11] = {
    "NONE",             // 0  - 1     - Zero
    "Basic - 800",      // 1  - 800   - Basic
    "Middle - 1500",    // 2  - 1500  - Middle
    "High - 3000",      // 3  - 3000  - High
    "CET4 - 4000",      // 4  - 4000  - CET4
    "CET6 - 6000",      // 5  - 6000  - CET6
    "IELTS - 8000",     // 6  - 8000  - IELTS
    "TOFEL - 9000",     // 7  - 9000  - TOFEL
    "SAT - 10000",      // 8  - 10000 - SAT
    "GRE - 12000",      // 9  - 12448 - GRE
    "GODLIKE - 40000"   // 10 - 42814 - HolyShit
};

@implementation SettingViewController

@synthesize nameTextField, pickerView;

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

- (void)update
{
    //
    NSString* nameString = _settingVirtualActor.user.profile.nickname;
    [self.nameTextField setText:nameString];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    [self initNavigationBar];
    
    //
    [self update];
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

#pragma mark - IBAction

- (IBAction)curLevelButtonClicked:(id)sender
{
    //
    int row = [_settingVirtualActor.user.defult.currentLevel intValue] - 1;
    [self.pickerView selectRow:row inComponent:0 animated:YES];
    
    // Show pickerView
    [UIView animateWithDuration:0.3 animations:^(void)
     {
         [self.pickerView setFrame:kPickerViewFrameShow];
     }
     ];
}

- (IBAction)tarLevelButtonClicked:(id)sender
{
    //
    int row = [_settingVirtualActor.user.defult.targetLevel intValue] - 1;
    [self.pickerView selectRow:row inComponent:0 animated:YES];

    // Show pickerView
    [UIView animateWithDuration:0.3 animations:^(void)
     {
         [self.pickerView setFrame:kPickerViewFrameShow];
     }
     ];
}

#pragma mark - RKNavigationControllerDelegate

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

#pragma mark - UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString* string = [NSString string];
    
    string = [NSString stringWithCString:nameArray[row+1]];
    
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
