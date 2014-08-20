//
//  TBBTListSLViewController.m
//  Wordsss
//
//  Created by Kelvin Ren on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "TBBTListSLViewController.h"
#import "TBBTListSLCell.h"

@interface TBBTListSLViewController ()

@end

@implementation TBBTListSLViewController

@synthesize titleLabel;

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
    [self.titleLabel setText:@"TBBT"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Instance method

- (TBBTListSLViewController*)initWithList:(List*)list
{
    _list = list;
    
    return self;
}

#pragma mark - IBAction

- (IBAction)navigationBackButtonClicked:(id)sender
{
    [[self navigationController] popViewControllerAnimated:YES];       
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TBBTListSLTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Configure the cell...
    NSNumber* seasonNum = [NSNumber numberWithInt:(int)(indexPath.row + 1)];
    [(TBBTListSLCell*)cell setSeasonNum:seasonNum];
    [(TBBTListSLCell*)cell configCell];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBBTListELViewController* tevc = [self.storyboard instantiateViewControllerWithIdentifier:@"TBBTListELViewController"];
    tevc = [tevc initWithSeasonNum:[NSNumber numberWithInt:(int)(indexPath.row + 1)]];
    [[self navigationController] pushViewController:tevc animated:YES];
}

@end
