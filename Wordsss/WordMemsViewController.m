//
//  WordMemsViewController.m
//  Wordsss
//
//  Created by Ren Kelvin on 10/5/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import "WordMemsViewController.h"

@implementation WordMemsViewController

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

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 }
 */

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

- (WordMemsViewController*)init:(WordVirtualActor*)wordVirtualActor
{
    //
    _wordVirtualActor = wordVirtualActor;
    
    return self;
}

#pragma - UITableViewDelegate



#pragma - UITableViewDataSource

// Section number
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int num = [[_wordVirtualActor getWordMems] count];
    
    return num;
}

// Cell number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int num = [[[_wordVirtualActor getWordMems] objectAtIndex:section] count];
    
    return num;
}

// Header View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RKTableHeader *headerView = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:0];
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    NSArray* array = [[_wordVirtualActor getWordMems] objectAtIndex:section];
    // Association
    if ([[array lastObject] class] == [Word_Association class]) {
        NSString* string = [NSString stringWithFormat:@"联想"];
        
        [headerView.titleLabel setText:string];
    }
    // Rootaffix
    else if ([[array lastObject] class] == [Word_Rootaffix class]) {
        NSString* string = [NSString stringWithFormat:@"词根 - %@", ((Rootaffix*)[array objectAtIndex:0]).phrase];
        
        [headerView.titleLabel setText:string];
    }
    // Sense
    else if ([[array lastObject] class] == [Word_Sense class]) {
        NSString* string = [NSString stringWithFormat:@"意群 - %@", ((Sense*)[array objectAtIndex:0]).meaning_cn];
        
        [headerView.titleLabel setText:string];
    }
    
    return headerView;
}

// Header height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 28;
}

// Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* WordBooksTableViewCellIndentifier = @"WordMemsTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WordBooksTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordBooksTableViewCellIndentifier];
    }
    
    NSArray* array = [[_wordVirtualActor getWordMems] objectAtIndex:indexPath.section];
    // Association
    if ([[array lastObject] class] == [Word_Association class]) {
        Word_Association* wa = [array objectAtIndex:indexPath.row];
        [(WordCellMem*)cell clear];
        [(WordCellMem*)cell setWord_association:wa];
        [(WordCellMem*)cell configCell];
    }
    // Rootaffix
    else if ([[array lastObject] class] == [Word_Rootaffix class]) {
        if (indexPath.row == 0) {
            Rootaffix* r = [array objectAtIndex:indexPath.row];
            [(WordCellMem*)cell clear];
            [(WordCellMem*)cell setRootaffix:r];
            [(WordCellMem*)cell configCell];
        }
        else {
            Word_Rootaffix* wr = [array objectAtIndex:indexPath.row];
            [(WordCellMem*)cell clear];
            [(WordCellMem*)cell setWord_rootaffix:wr];
            [(WordCellMem*)cell configCell];
        }
    }
    // Sense
    else if ([[array lastObject] class] == [Word_Sense class]) {
        if (indexPath.row == 0) {
            Sense* s = [array objectAtIndex:indexPath.row];
            [(WordCellMem*)cell clear];
            [(WordCellMem*)cell setSense:s];
            [(WordCellMem*)cell configCell];
        }
        else {
            Word_Sense* ws = [array objectAtIndex:indexPath.row];
            [(WordCellMem*)cell clear];
            [(WordCellMem*)cell setWord_sense:ws];
            [(WordCellMem*)cell configCell];
        }
    }
    
    return cell;
}

@end
