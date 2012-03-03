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
@synthesize coverButton, footerView, footerButton;

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
}

- (void)viewDidAppear:(BOOL)animated
{
    //
    [self.searchBar becomeFirstResponder];
    
    //
    isReady = NO;
    [self performSelectorInBackground:@selector(getWVA) withObject:nil];
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

#pragma mark - IBAction

- (IBAction)coverButtonClicked:(id)sender
{
    [self.coverButton setHidden:YES];
    
    [self.searchBar resignFirstResponder];
}

- (IBAction)footerButtonClicked:(id)sender
{
    NSString* searchText = self.searchBar.text;
    
    if ([searchText compare:@""] == NSOrderedSame) {
        if ([_rowArray count] != 0) {
            UIActionSheet* actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"清空搜索历史" otherButtonTitles:nil];
            UITabBar* tabBar = ((RKTabBarController*)[[UIApplication sharedApplication] delegate].window.rootViewController).tabBar;
            [actionSheet showFromTabBar:tabBar];
        }
    }
    else {
        
    }
}

#pragma mark - UITableViewDelegate

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

#pragma mark - refresh

- (void)refreshFooter
{
    [self.tableView setTableFooterView:nil];
    
    NSString* searchText = self.searchBar.text;
    
    if ([searchText compare:@""] == NSOrderedSame) {
        if ([_rowArray count] != 0) {
            [self.tableView setTableFooterView:self.footerView];
            [self.footerButton setTitle:@"清空搜索历史 ..." forState:UIControlStateNormal];
            [self.footerButton setUserInteractionEnabled:YES];
        }
    }
    else {
        if ([_rowArray count] == 0) {
            [self.tableView setTableFooterView:self.footerView];
            [self.footerButton setTitle:@"无搜索结果" forState:UIControlStateNormal];
            [self.footerButton setUserInteractionEnabled:NO];
        }
    }
}

- (void)refreshData
{
    if (!isReady) {
        return;
    }
    
    NSString* searchText = self.searchBar.text;
    
    if ([searchText compare:@""] == NSOrderedSame) {
        NSArray* idArray = [_exploreVirtualActor getSearchHisWordID];
        WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
        _rowArray = [wdm getWordsWithIds:idArray];
    }
    else {
        WordsssDBVirtualActor* wva = [WordsssDBVirtualActor wordsssDBVirtualActor];
        _rowArray = [wva getWordsWithPrefix:searchText];
    }
    
    //
    [self refreshFooter];
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
    //    //
    //    [self refreshData];
    //    //
    //    [self reloadData];
    
    //
    [searchbar resignFirstResponder];    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //
    [self.searchBar resignFirstResponder];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
            UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
            [uva clearSearchHis];
            
            [_exploreVirtualActor updateSearchHis];
            
            [self refreshData];
            [self reloadData];
            
            break;
        }
        default:
            break;
    }
}

@end
