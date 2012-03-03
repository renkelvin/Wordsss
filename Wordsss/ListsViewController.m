//
//  ListsViewController.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-2.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "ListsViewController.h"

@implementation ListsViewController

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
    
    //
    _listsVirtualActor = [ListsVirtualActor listsVirtualActor];
    
    //
    _listNameArray = [NSArray arrayWithObjects:@"数学词表", @"计算机词表", nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [[[self navigationController] navigationBar] setBackgroundImage:[UIImage imageNamed:@"topbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
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

- (IBAction)featureList1ButtonClicked:(id)sender
{
    // 物理
    NSDictionary* dict = [_listsVirtualActor getListDictionary];
    List* list = [dict objectForKey:@"物理词表"];
    PHListViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PHListViewController"];
    lvc = [lvc initWithList:list];
    [[self navigationController] pushViewController:lvc animated:YES];    
}

- (IBAction)featureList2ButtonClicked:(id)sender
{
    // GRE红宝书
    NSDictionary* dict = [_listsVirtualActor getListDictionary];
    List* list = [dict objectForKey:@"词表"];
    GRERBLLListViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"GRERBLLListViewController"];
    lvc = [lvc initWithList:list];
    [[self navigationController] pushViewController:lvc animated:YES];    
}

#pragma - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* listName = [_listNameArray objectAtIndex:indexPath.row];
    
    // 数学词表
    if ([listName compare:@"数学词表"] == NSOrderedSame) {
        MAListViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MAListViewController"];
        ListCell* cell = (ListCell*)[tableView cellForRowAtIndexPath:indexPath];
        lvc = [lvc initWithList:cell.list];
        [[self navigationController] pushViewController:lvc animated:YES];    
    }
    
    // 计算机词表
    else if ([listName compare:@"计算机词表"] == NSOrderedSame) {
        CSListViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"CSListViewController"];
        ListCell* cell = (ListCell*)[tableView cellForRowAtIndexPath:indexPath];
        lvc = [lvc initWithList:cell.list];
        [[self navigationController] pushViewController:lvc animated:YES];    
    }
}

#pragma - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RKTableHeader *headerView = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:0];
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    switch (section) {
        case 0:
        {
            headerView.titleLabel.text = @"其他词表";
            
            break;
        }   
        case 1:
        {
            headerView.titleLabel.text = @"即将推出";
            
            break;
        }   
        default:
        {
            break;
        }
    }
    
    return headerView;
}

// Section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return [[_listsVirtualActor getListDictionary] count] - 2;
            
            break;
        }   
        case 1:
        {
            return 4;
            
            break;
        }   
        default:
        {
            return 0;
            
            break;
        }
    }
}

// Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* WordBooksTableViewCellIndentifier = @"ListsTableViewCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WordBooksTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordBooksTableViewCellIndentifier];
    }
    
    switch (indexPath.section) {
        case 0:
        {
            NSDictionary* dict = [_listsVirtualActor getListDictionary];
            List* list = nil;
            NSString* listName = [_listNameArray objectAtIndex:indexPath.row];
            list = [dict objectForKey:listName];
            
            [(ListCell*)cell setList:list];
            [(ListCell*)cell configCell];
            
            break;
        }   
        case 1:
        {
            
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
