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
@synthesize coverButton;

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
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    _exploreVirtualActor = [ExploreVirtualActor exploreVirtualActor];
    
    //
    [self refreshData];
    
    //
    isReady = NO;
    [self performSelectorInBackground:@selector(getWVA) withObject:nil];
}

- (void)getWVA
{
    //
    [WordsssDBVirtualActor wordsssDBVirtualActor];
    
    isReady = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    //
    [[[self navigationController] navigationBar] setBackgroundImage:[UIImage imageNamed:@"topbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    [self.searchBar setBackgroundImage:[UIImage imageNamed:@"topbar_bg.png"]];
    
    //
    [self.searchBar becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    //
    [self.searchBar resignFirstResponder];
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

- (IBAction)coverButtonClicked:(id)sender
{
    [self.coverButton setHidden:YES];
    
    [self.searchBar resignFirstResponder];
}

#pragma - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
    [self.searchBar resignFirstResponder];
    
    //
    WordCell* wc = (WordCell*)[tableView cellForRowAtIndexPath:indexPath];
    Word* word = wc.word;
    
    WordViewController* wvc = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[word getTargetWord]];
    
    [[self navigationController] pushViewController:wvc animated:YES];
    
    //
    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    [uva createSearchHis:word];
    
    //
    [_exploreVirtualActor performSelectorInBackground:@selector(updateSearchHis) withObject:nil];
}

#pragma - UITableViewDataSource

// Section number
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Cell number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_rowArray count];
}

// Header View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RKTableHeader *headerView = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:0];
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    NSString* searchText = self.searchBar.text;
    if ([searchText compare:@""] == NSOrderedSame) {
        headerView.titleLabel.text = @"搜索历史";
    }
    else {
        headerView.titleLabel.text = @"搜索结果";
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
    static NSString* WordBooksTableViewCellIndentifier = @"ExploreTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WordBooksTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordBooksTableViewCellIndentifier];
    }
    
    NSString* searchText = self.searchBar.text;
    
    if ([searchText compare:@""] == NSOrderedSame) {
        [(WordCell*)cell clear];
        [(WordCell*)cell setWord:[_rowArray objectAtIndex:indexPath.row]];
        [(WordCell*)cell configCell];        
    }
    else {
        [(WordCell*)cell clear];
        [(WordCell*)cell setPureWord:[_rowArray objectAtIndex:indexPath.row]];
        [(WordCell*)cell configCell];        
    }
    
    return cell;
}

#pragma mark - 

- (void)refreshData
{
    NSString* searchText = self.searchBar.text;
    
    if ([searchText compare:@""] == NSOrderedSame) {
        NSArray* idArray = [_exploreVirtualActor getSearchHisWordID];
        WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
        _rowArray = [wdm getWordsWithIds:idArray];
    }
    else {
        if (isReady) {
            WordsssDBVirtualActor* wva = [WordsssDBVirtualActor wordsssDBVirtualActor];
            _rowArray = [wva getWordsWithPrefix:searchText];
        }
    }
}

- (void)reloadData
{
    [self.tableView reloadData];
}

#pragma mark - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    //
    [self refreshData];
    //
    [self reloadData];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self.coverButton setHidden:NO];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    [self.coverButton setHidden:YES];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchbar
{
    //
    [self refreshData];
    //
    [self reloadData];
    
    //
    [searchbar resignFirstResponder];    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //
    [self.searchBar resignFirstResponder];
}

@end
