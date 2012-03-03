//
//  CSListViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 2/29/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "CSListViewController.h"

@interface CSListViewController ()

@end

@implementation CSListViewController

@synthesize titleLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //
    [self.titleLabel setText:@"计算机词表"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Instance method

- (CSListViewController*)initWithList:(List*)list
{
    _list = list;
    
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    _listWordArray = [wdm getListWordArray:_list];
    
    return self;
}

#pragma mark - IBAction

- (IBAction)navigationBackButtonClicked:(id)sender
{
    [[self navigationController] popViewControllerAnimated:YES];       
}

#pragma - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 计算机
    CSListWordCell* cell = (CSListWordCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    Word* word = nil;
    if (cell.csListWord) {
        word = cell.csListWord.word_list.word;
    }
    
    WordViewController* wvc = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[word getTargetWord]];        
    [[self navigationController] pushViewController:wvc animated:YES];
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
    int num = 0;
    
    num = [_listWordArray count];
    
    return num;
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
    return 0;
}

// Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* ListTableViewCellIndentifier = @"CSListTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ListTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ListTableViewCellIndentifier];
    }
    
    CSListWord* csListWord = [_listWordArray objectAtIndex:indexPath.row];
    [(CSListWordCell*)cell setCsListWord:csListWord];
    [(CSListWordCell*)cell configCell];
    
    return cell;
}

@end
