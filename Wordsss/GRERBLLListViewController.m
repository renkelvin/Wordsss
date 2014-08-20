//
//  GRERBLLListViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 2/29/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "GRERBLLListViewController.h"

@interface GRERBLLListViewController ()

@end

@implementation GRERBLLListViewController

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
    [self.titleLabel setText:@"GRE词汇精选"];
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

- (GRERBLLListViewController*)initWithList:(List*)list
{
    _list = list;
    
    //    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    //    NSArray* array = [wdm getListWordArray:_list];
    //    
    //    _listWordArray = array;
    
    //    UserVirtualActor* uva = [UserVirtualActor userVirtualActor];
    //    for (GRERBListWord* w in array) {
    //        [uva createWordRecord:w.word_list.word];
    //    }
    
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
    // 
    GRERBWLListViewController* gwvc = [self.storyboard instantiateViewControllerWithIdentifier:@"GRERBWLListViewController"];        
    
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    NSArray* array = [wdm getGRERBListWordArrayWithList:[NSNumber numberWithInt:(int)(indexPath.row + 1)]];
    
    gwvc = [gwvc initWithListWordArray:array listNum:[NSNumber numberWithInt:(int)(indexPath.row + 1)]];
    [[self navigationController] pushViewController:gwvc animated:YES];
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
    
    num = 50;
    
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
    static NSString* ListTableViewCellIndentifier = @"GRERBListLLTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ListTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ListTableViewCellIndentifier];
    }
    
    NSNumber* listNum = [NSNumber numberWithInt:(int)(indexPath.row + 1)];
    [(GRERBListListCell*)cell setListNum:listNum];
    [(GRERBListListCell*)cell configCell];
    
    return cell;
}

@end
