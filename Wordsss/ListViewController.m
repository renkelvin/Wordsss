//
//  ListViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 2/22/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "ListViewController.h"

@implementation ListViewController

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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - IBAction

- (IBAction)navigationBackButtonClicked:(id)sender
{
    [[self navigationController] popViewControllerAnimated:YES];       
}

#pragma mark -

- (ListViewController*)initWithList:(List*)list
{
    _list = list;

    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    _listWordArray = [wdm getListWordArray:_list];

    return self;
}

#pragma - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Word* word = nil;
    
    WordViewController* wvc = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[word getTargetWord] and:nil];
    
    [[self navigationController] pushViewController:wvc animated:YES];
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
    return [_list.num intValue];
}

// Header View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RKTableHeader *headerView = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:0];
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    headerView.titleLabel.text = @"---";
    
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
    static NSString* ListTableViewCellIndentifier = @"ListTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ListTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ListTableViewCellIndentifier];
    }
    
    if ([_list.name compare:@"数学词表"] == NSOrderedSame) {
        MAListWord* maListWord = [_listWordArray objectAtIndex:indexPath.row];
        [(ListWordCell*)cell setMaListWord:maListWord];
        [(ListWordCell*)cell configCell];
    }
    else if ([_list.name compare:@"物理词表"] == NSOrderedSame) {
        PHListWord* phListWord = [_listWordArray objectAtIndex:indexPath.row];
        [(ListWordCell*)cell setPhListWord:phListWord];
        [(ListWordCell*)cell configCell];
    }
    else if ([_list.name compare:@"计算机词表"] == NSOrderedSame) {
        CSListWord* csListWord = [_listWordArray objectAtIndex:indexPath.row];
        [(ListWordCell*)cell setCsListWord:csListWord];
        [(ListWordCell*)cell configCell];
    }
    
    return cell;
}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [[self navigationController] setDelegate:(id<UINavigationControllerDelegate>)viewController];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    [self initNavigationBar];
}

@end
