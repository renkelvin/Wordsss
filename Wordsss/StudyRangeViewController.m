//
//  StudyRangeViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 3/4/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "StudyRangeViewController.h"

static char* nameArray[11] = {
    "未制定",             // 0  - 1     - Zero
    "基础",              // 1  - 800   - Basic
    "初中",              // 2  - 1500  - Middle
    "高中",              // 3  - 3000  - High
    "CET4",             // 4  - 4000  - CET4
    "CET6",             // 5  - 6000  - CET6
    "IELTS",            // 6  - 8000  - IELTS
    "TOEFL",            // 7  - 9000  - TOEFL
    "SAT",              // 8  - 10000 - SAT
    "GRE",              // 9  - 12448 - GRE
    "超神"              // 10 - 42814 - HolyShit
};

static char* vocaArray[11] = {
    "1",                // 0  - 1     - Zero
    "800",              // 1  - 800   - Basic
    "1500",             // 2  - 1500  - Middle
    "3000",             // 3  - 3000  - High
    "4000",             // 4  - 4000  - CET4
    "6000",             // 5  - 6000  - CET6
    "8000",             // 6  - 8000  - IELTS
    "9000",             // 7  - 9000  - TOEFL
    "10000",            // 8  - 10000 - SAT
    "12000",            // 9  - 12448 - GRE
    "40000"             // 10 - 42814 - HolyShit
};

@interface StudyRangeViewController ()

@end

@implementation StudyRangeViewController

@synthesize pickerView, pickerAccessoryView, nextStepButton;
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

- (void)viewDidLoad
{
    //
    [super viewDidLoad];
    
    //
    [[[self navigationController] navigationBar] setBackgroundImage:[UIImage imageNamed:@"topbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
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
    curORtar = 1;
    
    // Show pickerView
    [UIView animateWithDuration:0.3 animations:^(void)
     {
         [self.pickerView setFrame:kInitPickerViewFrameShow];
         [self.pickerAccessoryView setFrame:kInitPickerAccessoryViewFrameShow];
     }
     ];
}

- (void)next
{
    
}

#pragma mark - Instance method

- (IBAction)doneButtonClicked:(id)sender
{
    //
    int curRow = [self.pickerView selectedRowInComponent:0];
    int tarRow = [self.pickerView selectedRowInComponent:1];
    
    // ERROR
    if (curRow >= tarRow) {
        [[[UIAlertView alloc] initWithTitle:@"范围无效" message:@"您必须从较低水平选择至较高水平。" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil] show];
    }
    else {
        _userVirtualActor.user.defult.currentLevel = [NSNumber numberWithInt:curRow + 1];
        _userVirtualActor.user.defult.targetLevel = [NSNumber numberWithInt:tarRow + 1];
        
        // Update label
        [self.curLabel setText:[NSString stringWithCString:nameArray[curRow+1] encoding:4]];
        [self.tarLabel setText:[NSString stringWithCString:nameArray[tarRow+1] encoding:4]];
        
        // Hide pickerView
        [UIView animateWithDuration:0.3 animations:^(void)
         {
             [self.pickerView setFrame:kInitPickerViewFrameHide];
             [self.pickerAccessoryView setFrame:kInitPickerAccessoryViewFrameHide];
         }];
    }
}

- (IBAction)nextStep
{
    // Hide
    if (self.pickerAccessoryView.frame.origin.y == 416) {
        NSString* string = self.curLabel.text;
        if ([string compare:@"未指定"] == NSOrderedSame) {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"选择学习范围" message:@"请您选择您的学习范围：当前词汇水平以及目标水平。" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else {
            [self next];
        }
    }
    // Show
    else {
        //
        int curRow = [self.pickerView selectedRowInComponent:0];
        int tarRow = [self.pickerView selectedRowInComponent:1];
        
        // ERROR
        if (curRow >= tarRow) {
            [[[UIAlertView alloc] initWithTitle:@"范围无效" message:@"您必须从较低水平选择至较高水平。" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil] show];
        }
        else {
            _userVirtualActor.user.defult.currentLevel = [NSNumber numberWithInt:curRow + 1];
            _userVirtualActor.user.defult.targetLevel = [NSNumber numberWithInt:tarRow + 1];
            
            // Update label
            [self.curLabel setText:[NSString stringWithCString:nameArray[curRow+1] encoding:4]];
            [self.tarLabel setText:[NSString stringWithCString:nameArray[tarRow+1] encoding:4]];
            
            // Hide pickerView
            [UIView animateWithDuration:0.3 animations:^(void)
             {
                 [self.pickerView setFrame:kInitPickerViewFrameHide];
                 [self.pickerAccessoryView setFrame:kInitPickerAccessoryViewFrameHide];
             }];
            
            //
            [self next];
        }
    }
}

- (IBAction)lastStep
{
    [[self navigationController] popViewControllerAnimated:YES];
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

@end
