//
//  GRERBWLListViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 2/29/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "GRERBWLListViewController.h"

@interface GRERBWLListViewController ()

@end

@implementation GRERBWLListViewController

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
    [self.titleLabel setText:[NSString stringWithFormat:@"List %d", [_listNum intValue]]];
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

- (GRERBWLListViewController*)initWithListWordArray:(NSArray*)listWordArray listNum:(NSNumber*)listNum
{
    _listNum = listNum;
    
    //    int a = [listNum intValue] - 1;
    //    int b = [listNum intValue];
    //    a = countArray[a];
    //    b = countArray[b];
    //    
    //    _listWordArray = [listWordArray subarrayWithRange:NSMakeRange(a, b - a)];
    
    _listWordArray = listWordArray;
    
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
    GRERBListWordCell* cell = (GRERBListWordCell*)[tableView cellForRowAtIndexPath:indexPath];
    
    Word* word = nil;
    if (cell.grerbListWord) {
        word = cell.grerbListWord.word_list.word;
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
    return [_listWordArray count];
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
    static NSString* ListTableViewCellIndentifier = @"GRERBListWLTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ListTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ListTableViewCellIndentifier];
    }
    
    GRERBListWord* grerbListWord = [_listWordArray objectAtIndex:indexPath.row];
    [(GRERBListWordCell*)cell setGrerbListWord:grerbListWord];
    [(GRERBListWordCell*)cell configCell];
    
    return cell;
}

@end
