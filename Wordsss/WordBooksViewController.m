//
//  WordBooksViewController.m
//  Wordsss
//
//  Created by Ren Kelvin on 10/5/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import "WordBooksViewController.h"

@implementation WordBooksViewController

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

- (WordBooksViewController*)init:(WordVirtualActor*)wordVirtualActor
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
    return 2;
}

// Cell number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [[_wordVirtualActor getAhdDictWord]count] + [[_wordVirtualActor getSentence]count];
        case 1:
            return [[_wordVirtualActor getMwcDictWord]count];
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
            headerView.titleLabel.text = @"美国传统词典";
            break;
        case 1:
            headerView.titleLabel.text = @"韦氏大学词典";
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
            if ([[_wordVirtualActor getAhdDictWord]count] + [[_wordVirtualActor getSentence]count]) {
                return 28;
            }
            else {
                return 0;
            }
        case 1:
            if ([[_wordVirtualActor getMwcDictWord]count]) {
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
    static NSString* WordBooksTableViewCellIndentifier = @"WordBooksTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WordBooksTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordBooksTableViewCellIndentifier];
    }
    
    switch (indexPath.section) {
        case 0:
        {
            int idx = indexPath.row;
            
            if (idx < [[_wordVirtualActor getAhdDictWord] count]) {
                AhdDictWord* word = [[_wordVirtualActor getAhdDictWord] objectAtIndex:idx];
                [(DictWordCell*)cell clear];
                [(DictWordCell*)cell setAhdDictWord:word];
                [(DictWordCell*)cell configCell];
            }
            else {
                idx -= [[_wordVirtualActor getAhdDictWord] count];
                
                AhdDictSentence* sentence = [[_wordVirtualActor getSentence] objectAtIndex:idx];
                [(DictWordCell*)cell clear];
                [(DictWordCell*)cell setAhdDictSentence:sentence];
                [(DictWordCell*)cell configCell];
            }
            
            break;
        }   
        case 1:
        {
            MwcDictWord* word = [[_wordVirtualActor getMwcDictWord] objectAtIndex:indexPath.row];
            [(DictWordCell*)cell clear];
            [(DictWordCell*)cell setMwcDictWord:word];
            [(DictWordCell*)cell configCell];
            
            break;
        }
        default:
        {
            break;   
        }
    }
    
    return cell;
}

// Cell height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DictWordCell* cell = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:1];
    
    switch (indexPath.section) {
        case 0:
        {
            int idx = indexPath.row;
            
            if (idx < [[_wordVirtualActor getAhdDictWord] count]) {
                AhdDictWord* word = [[_wordVirtualActor getAhdDictWord] objectAtIndex:idx];
                [(DictWordCell*)cell clear];
                [(DictWordCell*)cell setAhdDictWord:word];
                [(DictWordCell*)cell configCell];
            }
            else {
                idx -= [[_wordVirtualActor getAhdDictWord] count];
                
                AhdDictSentence* sentence = [[_wordVirtualActor getSentence] objectAtIndex:idx];
                [(DictWordCell*)cell clear];
                [(DictWordCell*)cell setAhdDictSentence:sentence];
                [(DictWordCell*)cell configCell];
            }
            
            return [cell getHeight];
            
            break;
        }   
        case 1:
        {
            MwcDictWord* word = [[_wordVirtualActor getMwcDictWord] objectAtIndex:indexPath.row];
            [(DictWordCell*)cell clear];
            [(DictWordCell*)cell setMwcDictWord:word];
            [(DictWordCell*)cell configCell];
            
            return [cell getHeight];
            
            break;
        }
        default:
        {
            break;   
        }
    }
    
    return [cell getHeight];
}

@end
