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
    "Basic",            // 1  - 800   - Basic
    "Middle",           // 2  - 1500  - Middle
    "High",             // 3  - 3000  - High
    "CET4",             // 4  - 4000  - CET4
    "CET6",             // 5  - 6000  - CET6
    "IELTS",            // 6  - 8000  - IELTS
    "TOFEL",            // 7  - 9000  - TOFEL
    "SAT",              // 8  - 10000 - SAT
    "GRE",              // 9  - 12448 - GRE
    "GODLIKE"           // 10 - 42814 - HolyShit
};

static char* vocaArray[11] = {
    "1",                // 0  - 1     - Zero
    "800",              // 1  - 800   - Basic
    "1500",             // 2  - 1500  - Middle
    "3000",             // 3  - 3000  - High
    "4000",             // 4  - 4000  - CET4
    "6000",             // 5  - 6000  - CET6
    "8000",             // 6  - 8000  - IELTS
    "9000",             // 7  - 9000  - TOFEL
    "10000",            // 8  - 10000 - SAT
    "12000",            // 9  - 12448 - GRE
    "40000"             // 10 - 42814 - HolyShit
};

@implementation SettingViewController

@synthesize nameTextField, pickerView, pickerAccessoryView;
@synthesize curLabel, tarLabel;

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
    
    //
    int curLvl = [_settingVirtualActor.user.defult.currentLevel intValue];
    int tarLvl = [_settingVirtualActor.user.defult.targetLevel intValue];
    
    // Update label
    [self.curLabel setText:[NSString stringWithCString:nameArray[curLvl] encoding:4]];
    [self.tarLabel setText:[NSString stringWithCString:nameArray[tarLvl] encoding:4]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Get todayVirtualActor
    _settingVirtualActor = [SettingVirtualActor settingVirtualActor];
    
    // Init rknc delegate
    [[self navigationController] setDelegate:self];

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
    int curRow = [_settingVirtualActor.user.defult.currentLevel intValue] - 1;
    [self.pickerView selectRow:curRow inComponent:0 animated:YES];
    int tarRow = [_settingVirtualActor.user.defult.targetLevel intValue] - 1;
    [self.pickerView selectRow:tarRow inComponent:1 animated:YES];
    
    //
    curORtar = 0;
    
    // Show pickerView
    [UIView animateWithDuration:0.3 animations:^(void)
     {
         [self.pickerView setFrame:kInitPickerViewFrameShow];
         [self.pickerAccessoryView setFrame:kInitPickerAccessoryViewFrameShow];
     }
     ];
}

- (IBAction)tarLevelButtonClicked:(id)sender
{
    //
    int curRow = [_settingVirtualActor.user.defult.currentLevel intValue] - 1;
    [self.pickerView selectRow:curRow inComponent:0 animated:YES];
    int tarRow = [_settingVirtualActor.user.defult.targetLevel intValue] - 1;
    [self.pickerView selectRow:tarRow inComponent:1 animated:YES];
    
    //
    curORtar = 1;
    
    // Show pickerView
    [UIView animateWithDuration:0.3 animations:^(void)
     {
         [self.pickerView setFrame:kInitPickerViewFrameShow];
         [self.pickerAccessoryView setFrame:kInitPickerAccessoryViewFrameShow];
     }
     ];
}

- (IBAction)doneButtonClicked:(id)sender
{
    //
    int curRow = [self.pickerView selectedRowInComponent:0];
    int tarRow = [self.pickerView selectedRowInComponent:1];
    
    _settingVirtualActor.user.defult.currentLevel = [NSNumber numberWithInt:curRow + 1];
    _settingVirtualActor.user.defult.targetLevel = [NSNumber numberWithInt:tarRow + 1];
    
    // Update label
    [self.curLabel setText:[NSString stringWithCString:nameArray[curRow+1] encoding:4]];
    [self.tarLabel setText:[NSString stringWithCString:nameArray[tarRow+1] encoding:4]];
    
    // Hide pickerView
    [UIView animateWithDuration:0.3 animations:^(void)
     {
         [self.pickerView setFrame:kInitPickerViewFrameHide];
         [self.pickerAccessoryView setFrame:kInitPickerAccessoryViewFrameHide];
     }
     ];
}

#pragma mark - RKNavigationControllerDelegate

- (void)initNavigationBar
{    
    RKNavigationController* navigationController = (RKNavigationController*)[self navigationController];
    
    [[navigationController backgroundImageView] setImage:[UIImage imageNamed:@"topbar_bg.png"]];
    
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
    
    string = [NSString stringWithFormat:@"%@ - %@", [NSString stringWithCString:nameArray[row+1] encoding:4], [NSString stringWithCString:vocaArray[row+1] encoding:4]];
    
    return string;
}

#pragma mark - UIPickerViewDatasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //
    [textField resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    //
    [_settingVirtualActor.user.profile setNickname:textField.text];
}

@end
