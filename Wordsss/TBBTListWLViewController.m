//
//  TBBTListWLViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "TBBTListWLViewController.h"
#import "TBBTListWLCell.h"

@interface TBBTListWLViewController ()

@end

@implementation TBBTListWLViewController

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
	// Do any additional setup after loading the view.
    
    //
    [self.titleLabel setText:[NSString stringWithFormat:@"Detail"]];
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

#pragma mark - Instance method

- (TBBTListWLViewController*)initWithListWordArray:(NSArray*)array
{
    _listWordArray = array;
    
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
    return [_listWordArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TBBTListWLTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    TBBTListWord* tbbtListWord = [_listWordArray objectAtIndex:indexPath.row];
    [(TBBTListWLCell*)cell setTbbtListWord:tbbtListWord];
    [(TBBTListWLCell*)cell configCell];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBBTListWLCell* cell = (TBBTListWLCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    Word* word = nil;
    if (cell.tbbtListWord) {
        word = cell.tbbtListWord.word_list.word;
    }
    
    WordViewController* wvc = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[word getTargetWord]];        
    [[self navigationController] pushViewController:wvc animated:YES];
}

@end
