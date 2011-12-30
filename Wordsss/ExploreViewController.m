//
//  ExploreViewController.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-3.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "ExploreViewController.h"

@implementation ExploreViewController

@synthesize searchBar = _searchBar;

@synthesize tableView = _tableView;

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

//
- (void)initSearchBar
{
    _searchBar.hidden = NO;  
    _searchBar.placeholder=[NSString stringWithCString:"请输入需要查找的文本内容" encoding: NSUTF8StringEncoding];  
    
    _tableView.tableHeaderView = self.searchBar;  
}

//
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    _exploreVirtualActor = [ExploreVirtualActor exploreVirtualActor];
    
    //
    [self initNavigationBar];
    
    //
    // [self initSearchBar];
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
            return [[_exploreVirtualActor getAssociation]count];
        case 1:
            return [[_exploreVirtualActor getRootaffix]count];
        case 2:
            return [[_exploreVirtualActor getSense]count];
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
            headerView.titleLabel.text = @"联想";
            break;
        case 1:
            headerView.titleLabel.text = @"字根";
            break;
        case 2:
            headerView.titleLabel.text = @"意群";
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
            if ([[_exploreVirtualActor getAssociation]count]) {
                return 28;
            }
            else {
                return 0;
            }
        case 1:
            if ([[_exploreVirtualActor getRootaffix]count]) {
                return 28;
            }
            else {
                return 0;
            }
        case 2:
            if ([[_exploreVirtualActor getSense]count]) {
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
    static NSString* WordBooksTableViewCellIndentifier = @"ExploreTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WordBooksTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordBooksTableViewCellIndentifier];
    }
    
    switch (indexPath.section) {
        case 0:
        {
            Word_Association* word_association = [[_exploreVirtualActor getAssociation] objectAtIndex:indexPath.row];
            [word_association configCell:(WordCellMem*)cell];
            
            break;
        }   
        case 1:
        {

            break;
        }   
        case 2:
        {
            if (indexPath.row == 0) {
                Sense* sense = [[_exploreVirtualActor getSense] objectAtIndex:indexPath.row];
                [sense configCell:(WordCellMem*)cell];
            }
            else {
                Word_Sense* word_sense = [[_exploreVirtualActor getSense] objectAtIndex:indexPath.row];
                [word_sense configCell:(WordCellMem*)cell];
            }
            
            break;
        }   
        default:
        {
            break;
        }
    }
    
    return cell;
}

#pragma - RKNavigationControllerDelegate

- (void)initNavigationBar
{        
    RKNavigationController* navigationController = (RKNavigationController*)[self navigationController];
    
    [[navigationController titleLabel] setText:@"Explore"];
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

@end
