//
//  TBBTListELViewController.m
//  Wordsss
//
//  Created by Ren Chuan on 7/12/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "TBBTListELViewController.h"
#import "TBBTListELCell.h"

@interface TBBTListELViewController ()

@end

@implementation TBBTListELViewController

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
	// Do any additional setup after loading the view.
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

#pragma mark - IBAction

- (IBAction)navigationBackButtonClicked:(id)sender
{
    [[self navigationController] popViewControllerAnimated:YES];       
}

#pragma mark - Instance method

- (TBBTListELViewController*)initWithSeasonNum:(NSNumber*)seasonNum
{
    _seasonNum = seasonNum;
    
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch ([_seasonNum intValue]) {
        case 1:
            return 17;
            break;
        case 2:
            return 23;
            break;
        case 3:
            return 23;
            break;
        case 4:
            return 24;
            break;
        case 5:
            return 24;
            break;
        default:
            return 0;
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TBBTListELTableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSNumber* episodeNum = [NSNumber numberWithInt:indexPath.row + 1];
    [(TBBTListELCell*)cell setEpisodeNum:episodeNum];
    [(TBBTListELCell*)cell configCell];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TBBTListTLViewController* ttvc = [self.storyboard instantiateViewControllerWithIdentifier:@"TBBTListTLViewController"];
    
    WordsssDBDataManager* wdm = [WordsssDBDataManager wordsssDBDataManager];
    NSNumber* seasonNum = _seasonNum;
    NSNumber* episodeNum = [NSNumber numberWithInt:indexPath.row + 1];
    NSArray* array = [wdm getTBBTListSentenceArrayWithSeason:seasonNum episode:episodeNum];
    
    ttvc = [ttvc initWithListSentenceArray:array seasonNum:_seasonNum episodeNum:episodeNum];
    [[self navigationController] pushViewController:ttvc animated:YES];
}

@end
