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
    _listDict = [_listsVirtualActor getListDictionary];
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
    // TBBT词表
    List* list = [_listDict objectForKey:@"TBBT词表"];
    TBBTListSLViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"TBBTListSLViewController"];
    lvc = [lvc initWithList:list];
    [[self navigationController] pushViewController:lvc animated:YES];
}

- (IBAction)featureList2ButtonClicked:(id)sender
{
    // GRERB词表
    List* list = [_listDict objectForKey:@"GRE红宝书"];
    GRERBLLListViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"GRERBLLListViewController"];
    lvc = [lvc initWithList:list];
    [[self navigationController] pushViewController:lvc animated:YES];
}

#pragma - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ListCell* cell = (ListCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell.list.name compare:@"数学词表"] == NSOrderedSame) {
        MAListViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"MAListViewController"];
        lvc = [lvc initWithList:cell.list];
        [[self navigationController] pushViewController:lvc animated:YES];
    }
    else if ([cell.list.name compare:@"物理词表"] == NSOrderedSame) {
        PHListViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"PHListViewController"];
        lvc = [lvc initWithList:cell.list];
        [[self navigationController] pushViewController:lvc animated:YES];
    }
    else if ([cell.list.name compare:@"计算机词表"] == NSOrderedSame) {
        CSListViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"CSListViewController"];
        lvc = [lvc initWithList:cell.list];
        [[self navigationController] pushViewController:lvc animated:YES];
    }
    else if ([cell.list.name compare:@"GRE红宝书"] == NSOrderedSame) {
        GRERBLLListViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"GRERBLLListViewController"];
        lvc = [lvc initWithList:cell.list];
        [[self navigationController] pushViewController:lvc animated:YES];
    }
    else if ([cell.list.name compare:@"新托福词汇分类突破"] == NSOrderedSame) {
        //
    }
    else if ([cell.list.name compare:@"TBBT词表"] == NSOrderedSame) {
        TBBTListSLViewController* lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"TBBTListSLViewController"];
        lvc = [lvc initWithList:cell.list];
        [[self navigationController] pushViewController:lvc animated:YES];
    }
    else if ([cell.list.name compare:@"Dota词表"] == NSOrderedSame) {
        //
    }
}

#pragma - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

// Header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RKTableHeader *headerView = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:0];
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    switch (section) {
        case 0:
        {
            headerView.titleLabel.text = @"考试用书";
            break;
        }
        case 1:
        {
            headerView.titleLabel.text = @"学科词表";
            break;
        }
        case 2:
        {
            headerView.titleLabel.text = @"游戏词表";
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
        case 0: // 考试用书
        {
            return 1;
            break;
        }
        case 1: // 学科词表
        {
            return 3;
            break;
        }
        case 2: // 游戏词表
        {
            return 1;
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
    
    List* list = nil;
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                    list = [_listDict objectForKey:@"新托福词汇分类突破"];
                    break;
                default:
                    break;
            };
            break;
        }
        case 1:
        {
            switch (indexPath.row) {
                case 0:
                    list = [_listDict objectForKey:@"数学词表"];
                    break;
                case 1:
                    list = [_listDict objectForKey:@"物理词表"];
                    break;
                case 2:
                    list = [_listDict objectForKey:@"计算机词表"];
                    break;
                default:
                    break;
            };
            break;
        }
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                    list = [_listDict objectForKey:@"Dota词表"];
                    break;
                default:
                    break;
            };
            break;
        }
        default:
            break;
    }
    
    [(ListCell*)cell setList:list];
    [(ListCell*)cell configCell];
    
    return cell;
}

@end
