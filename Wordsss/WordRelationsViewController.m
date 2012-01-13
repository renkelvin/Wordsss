//
//  WordRelationsViewController.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-6.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "WordRelationsViewController.h"

@implementation WordRelationsViewController

@synthesize wordViewController;

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

- (WordRelationsViewController*)init:(WordVirtualActor*)wordVirtualActor
{
    //
    _wordVirtualActor = wordVirtualActor;
    
    return self;
}

#pragma - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Word* word = nil;
    
    switch (indexPath.section) {
        case 0:
        {
            word = [[_wordVirtualActor getDerivative] objectAtIndex:indexPath.row];
            
            break;
        }
        case 1:
        {
            word = [[_wordVirtualActor getSynonym] objectAtIndex:indexPath.row];
            
            break;
        }
        case 2:
        {
            word = [[_wordVirtualActor getAntonym] objectAtIndex:indexPath.row];
            
            break;
        }
    }
    
    WordViewController* wvc = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[word getTargetWord]];
    
    [[self.wordViewController navigationController] pushViewController:wvc animated:YES];
}

#pragma - UITableViewDataSource

// Section number
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

// Cell number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [[_wordVirtualActor getDerivative]count];
        case 1:
            return [[_wordVirtualActor getSynonym]count];
        case 2:
            return [[_wordVirtualActor getAntonym]count];
        default:
            return 0;
    }
}

// Header View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RKTableHeader *headerView = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:0];
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    switch (section) {
        case 0:
            headerView.titleLabel.text = @"派生词";
            break;
        case 1:
            headerView.titleLabel.text = @"同义词";
            break;
        case 2:
            headerView.titleLabel.text = @"反义词";
            break;
        default:
            headerView.titleLabel.text = @"-----";
            break;
    }
    
    return headerView;
}

// Header height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            if ([[_wordVirtualActor getDerivative]count]) {
                return 28;
            }
            else {
                return 0;
            }
        case 1:
            if ([[_wordVirtualActor getSynonym]count]) {
                return 28;
            }
            else {
                return 0;
            }
        case 2:
            if ([[_wordVirtualActor getAntonym]count]) {
                return 28;
            }
            else {
                return 0;
            }
        default:
            return 0;
    }
}

// Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* WordBooksTableViewCellIndentifier = @"WordRelationsTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WordBooksTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordBooksTableViewCellIndentifier];
    }
    
    switch (indexPath.section) {
        case 0:
        {
            Word* deriWord = [[_wordVirtualActor getDerivative] objectAtIndex:indexPath.row];
            [(WordCell*)cell setWord:deriWord];
            [(WordCell*)cell configCell];
            
            break;
        }
        case 1:
        {
            Word* synoWord = [[_wordVirtualActor getSynonym] objectAtIndex:indexPath.row];
            [(WordCell*)cell setWord:synoWord];
            [(WordCell*)cell configCell];
            
            break;
        }
        case 2:
        {
            Word* antoWord = [[_wordVirtualActor getAntonym] objectAtIndex:indexPath.row];
            [(WordCell*)cell setWord:antoWord];
            [(WordCell*)cell configCell];
            
            break;
        }
        default:
        {
            break;
        }
    }
    
    return cell;
}

@end
