//
//  TBBTListTLViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "TBBTListTLViewController.h"
#import "TBBTListTLCell.h"

@interface TBBTListTLViewController ()

@end

@implementation TBBTListTLViewController

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
    [self.titleLabel setText:[NSString stringWithFormat:@"S%dE%d", [_seasonNum intValue], [_episodeNum intValue]]];
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

#pragma mark - IBAction

- (IBAction)navigationBackButtonClicked:(id)sender
{
    [[self navigationController] popViewControllerAnimated:YES];       
}

#pragma mark - Instance method

- (TBBTListTLViewController*)initWithListSentenceArray:listSentenceArray seasonNum:seasonNum episodeNum:episodeNum
{
    _seasonNum = seasonNum;
    _episodeNum = episodeNum;
    
    _listSentenceArray = listSentenceArray;
    
    return self;
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
    return [_listSentenceArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TBBTListTLTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    TBBTListSentence* tbbtListSentence = [_listSentenceArray objectAtIndex:indexPath.row];
    [(TBBTListTLCell*)cell setTbbtListSentence:tbbtListSentence];
    [(TBBTListTLCell*)cell configCell];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBBTListWLViewController* twvc = [self.storyboard instantiateViewControllerWithIdentifier:@"TBBTListWLViewController"];

    TBBTListSentence* sentence = [_listSentenceArray objectAtIndex:indexPath.row];
    NSArray* array = [sentence.tbbtListWord allObjects];
    
    twvc = [twvc initWithListWordArray:array];
    [[self navigationController] pushViewController:twvc animated:YES];
}

@end
