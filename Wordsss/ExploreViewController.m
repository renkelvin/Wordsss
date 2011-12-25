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
    //    _searchBar.autocorrectionType = UITextAutocorrectionTypeNo;  
    //    _searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;  
    //    _searchBar.keyboardType = UIKeyboardTypeAlphabet;  
    _searchBar.hidden = NO;  
    _searchBar.placeholder=[NSString stringWithCString:"请输入需要查找的文本内容" encoding: NSUTF8StringEncoding];  
    
    _tableView.tableHeaderView = self.searchBar;  
}

//
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    [self initNavigationBar];
    
    //
    [self initSearchBar];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

// Header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:0];
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    // TitleLabel
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(12, 0, 320, 28);
    label.backgroundColor = [UIColor clearColor];
    label.text = @"-----";
    [headerView addSubview:label];
    
    return headerView;
}

// Section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

// Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* WordBooksTableViewCellIndentifier = @"ExploreTableViewCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WordBooksTableViewCellIndentifier];
    if (cell == nil) {
        // need [ autorealse]
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordBooksTableViewCellIndentifier];
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
