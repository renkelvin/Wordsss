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
    return 3;
}

// Cell number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [[_wordVirtualActor getWordAssociation]count];
        case 1:
            return [[_wordVirtualActor getWordRootaffix]count];
        case 2:
            return [[_wordVirtualActor getWordSense]count];
        default:
            return 0;
    }
}

// Header View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:0];
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    // TitleLabel
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(12, 0, 320, 28);
    label.backgroundColor = [UIColor clearColor];
    
    switch (section) {
        case 0:
            label.text = @"联想";
            break;
        case 1:
            label.text = @"字根";
            break;
        case 2:
            label.text = @"意群";
            break;
        default:
            label.text = @"-----";
            break;
    }
    
    [headerView addSubview:label];
    
    return headerView;
}

// Header height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            if ([[_wordVirtualActor getWordAssociation]count]) {
                return 28;
            }
            else {
                return 0;
            }
       case 1:
            if ([[_wordVirtualActor getWordRootaffix]count]) {
                return 28;
            }
            else {
                return 0;
            }
        case 2:
            if ([[_wordVirtualActor getWordSense]count]) {
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
    static NSString* WordBooksTableViewCellIndentifier = @"WordMemsTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WordBooksTableViewCellIndentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordBooksTableViewCellIndentifier];
    }
    
    switch (indexPath.section) {
        case 0:
        {
            Word_Association* word_association = [[_wordVirtualActor getWordAssociation] objectAtIndex:indexPath.row];
            [word_association configCell:(WordCellMem*)cell];
            break;
        }   
        case 1:
        {
            ;
            break;
        }   
        case 2:
        {
            Word_Sense* word_sense = [[_wordVirtualActor getWordSense] objectAtIndex:indexPath.row];
            [word_sense configCell:(WordCellMem*)cell];
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
