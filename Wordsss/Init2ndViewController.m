//
//  Init2ndViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 12/27/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "Init2ndViewController.h"

static char* nameArray[13] = {
    "未制定",      // 0    - Zero
    "基础",       // 1    - Basic
    "初中",       // 2    - Middle
    "高中",       // 3    - High
    "CET4",     // 4    - CET4
    "CET6",     // 5    - CET6
    "考研",       // 6    - GET
    "IELTS",    // 7    - IELTS
    "TOEFL",    // 8    - TOEFL
    "SAT",      // 9    - SAT
    "GRE",      // 10   - GRE
    "GMAT",     // 11   - GMAT
    "超神"        // 12   - HolyShit
};

@implementation Init2ndViewController

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

#pragma mark - IBAction

- (IBAction)curLevelButtonClicked:(id)sender
{
    //
    //    int curRow = [_initVirtualActor.user.defult.currentLevel intValue] - 1;
    //    [self.pickerView selectRow:curRow inComponent:0 animated:YES];
    //    int tarRow = [_initVirtualActor.user.defult.targetLevel intValue] - 1;
    //    [self.pickerView selectRow:tarRow inComponent:1 animated:YES];
    
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
    //    int curRow = [_initVirtualActor.user.defult.currentLevel intValue] - 1;
    //    [self.pickerView selectRow:curRow inComponent:0 animated:YES];
    //    int tarRow = [_initVirtualActor.user.defult.targetLevel intValue] - 1;
    //    [self.pickerView selectRow:tarRow inComponent:1 animated:YES];
    
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
    //
    Init3rdViewController* ivc = [self.storyboard instantiateViewControllerWithIdentifier:@"Init3rdViewController"];
    [[self navigationController] pushViewController:ivc animated:YES];
}

#pragma mark - Instance method

- (IBAction)doneButtonClicked:(id)sender
{
    //
    int curRow = (int)[self.pickerView selectedRowInComponent:0];
    int tarRow = (int)[self.pickerView selectedRowInComponent:1];
    
    // ERROR
    if (curRow >= tarRow) {
        [[[UIAlertView alloc] initWithTitle:@"范围无效" message:@"您必须从较低水平选择至较高水平。" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil] show];
    }
    else {
        _initVirtualActor.user.defult.currentLevel = [NSNumber numberWithInt:curRow + 1];
        _initVirtualActor.user.defult.targetLevel = [NSNumber numberWithInt:tarRow + 1];
        
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
        int curRow = (int)[self.pickerView selectedRowInComponent:0];
        int tarRow = (int)[self.pickerView selectedRowInComponent:1];
        
        // ERROR
        if (curRow >= tarRow) {
            [[[UIAlertView alloc] initWithTitle:@"范围无效" message:@"您必须从较低水平选择至较高水平。" delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil] show];
        }
        else {
            _initVirtualActor.user.defult.currentLevel = [NSNumber numberWithInt:curRow + 1];
            _initVirtualActor.user.defult.targetLevel = [NSNumber numberWithInt:tarRow + 1];
            
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
    
    // string = [NSString stringWithFormat:@"%@ - %@", [NSString stringWithCString:nameArray[row+1] encoding:4], [NSString stringWithCString:vocaArray[row+1] encoding:4]];
    string = [NSString stringWithFormat:@"%@", [NSString stringWithCString:nameArray[row+1] encoding:4]];
    
    return string;
}

#pragma mark - UIPickerViewDatasource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 12;
}

@end
