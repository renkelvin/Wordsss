//
//  ListViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 2/22/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "ListViewController.h"

@implementation ListViewController

@synthesize listTitleLabel;

@synthesize grerbListNum;

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

- (void)viewWillAppear:(BOOL)animated
{
    [self.listTitleLabel setText:_list.name];
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
    
    if (!_list) {
        // List
        if ([self.grerbListNum intValue] == 0) {
            _listTableEnum = GRERBLISTLISTTABLE;
        }
        // Word
        else {
            _listTableEnum = GRERBLISTWORDTABLE;
        }
        
        return self;
    }
    
    // 数学
    if ([_list.name compare:@"数学词表"] == NSOrderedSame) {
        _listTableEnum = MALISTTABLE;
        
        WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
        _listWordArray = [wdm getListWordArray:_list];
    }
    // 物理
    else if ([_list.name compare:@"物理词表"] == NSOrderedSame) {
        _listTableEnum = PHLISTTABLE;
        
        WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
        _listWordArray = [wdm getListWordArray:_list];
    }
    // 计算机
    else if ([_list.name compare:@"计算机词表"] == NSOrderedSame) {
        _listTableEnum = CSLISTTABLE;
        
        WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
        _listWordArray = [wdm getListWordArray:_list];
    }
    // GRE红宝书
    //    else if ([_list.name compare:@"GRE红宝书"] == NSOrderedSame) {
    else {
        // List
        if ([self.grerbListNum intValue] == 0) {
            _listTableEnum = GRERBLISTLISTTABLE;
        }
        // Word
        else {
            _listTableEnum = GRERBLISTWORDTABLE;
        }
    }
    
    return self;
}

#pragma - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (_listTableEnum) {
        case MALISTTABLE:
        {
            // 数学
            ListWordCell* cell = (ListWordCell*)[tableView cellForRowAtIndexPath:indexPath];
            
            Word* word = nil;
            if (cell.maListWord) {
                word = cell.maListWord.word_list.word;
            }
            
            WordViewController* wvc = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[word getTargetWord]];        
            [[self navigationController] pushViewController:wvc animated:YES];
            
            break;
        }
        case PHLISTTABLE:
        {
            // 物理
            ListWordCell* cell = (ListWordCell*)[tableView cellForRowAtIndexPath:indexPath];
            
            Word* word = nil;
            if (cell.phListWord) {
                word = cell.phListWord.word_list.word;
            }
            
            WordViewController* wvc = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[word getTargetWord]];        
            [[self navigationController] pushViewController:wvc animated:YES];
            
            break;
        }
        case CSLISTTABLE:
        {
            // 计算机
            ListWordCell* cell = (ListWordCell*)[tableView cellForRowAtIndexPath:indexPath];
            
            Word* word = nil;
            if (cell.csListWord) {
                word = cell.csListWord.word_list.word;
            }
            
            WordViewController* wvc = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[word getTargetWord]];        
            [[self navigationController] pushViewController:wvc animated:YES];
            
            break;
        }
        case GRERBLISTLISTTABLE:
        {
            // 计算机
            ListWordCell* cell = (ListWordCell*)[tableView cellForRowAtIndexPath:indexPath];
            
            Word* word = nil;
            if (cell.csListWord) {
                word = cell.csListWord.word_list.word;
            }
            
            WordViewController* wvc = [[self.storyboard instantiateViewControllerWithIdentifier:@"WordViewController"] init:[word getTargetWord]];        
            [[self navigationController] pushViewController:wvc animated:YES];
            
            break;
        }
        default:
        {
            break;
        }
    }
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
    
    switch (_listTableEnum) {
        case MALISTTABLE:
        {
            // 数学
            num = [_list.num intValue];
            
            break;
        }   
        case PHLISTTABLE:
        {
            // 物理
            num = [_list.num intValue];
            
            break;
        }   
        case CSLISTTABLE:
        {
            // 计算机
            num = [_list.num intValue];
            
            break;
        }   
        case GRERBLISTLISTTABLE:
        {
            // GRE红宝书 List
            num = 50;
            
            break;
        }   
        case GRERBLISTWORDTABLE:
        {
            // GRE红宝书 Word
            
            break;
        }   
    }
    
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
    
    switch (_listTableEnum) {
        case MALISTTABLE:
        {
            // 数学
            MAListWord* maListWord = [_listWordArray objectAtIndex:indexPath.row];
            [(ListWordCell*)cell setMaListWord:maListWord];
            [(ListWordCell*)cell configCell];
            
            break;
        }   
        case PHLISTTABLE:
        {
            // 物理
            PHListWord* phListWord = [_listWordArray objectAtIndex:indexPath.row];
            [(ListWordCell*)cell setPhListWord:phListWord];
            [(ListWordCell*)cell configCell];
            
            break;
        }   
        case CSLISTTABLE:
        {
            // 计算机
            MAListWord* maListWord = [_listWordArray objectAtIndex:indexPath.row];
            [(ListWordCell*)cell setMaListWord:maListWord];
            [(ListWordCell*)cell configCell];
            
            break;
        }   
        case GRERBLISTLISTTABLE:
        {
            // GRE红宝书 List
            [(GRERBListListCell*)cell setListNum:[NSNumber numberWithInt:(indexPath.row+1)]];
            [(GRERBListListCell*)cell configCell];
            
            break;
        }   
        case GRERBLISTWORDTABLE:
        {
            // GRE红宝书 Word
            
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
