//
//  WordStatisticsViewController.m
//  Wordsss
//
//  Created by Ren Kelvin on 10/5/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import "WordStatisticsViewController.h"

@implementation WordStatisticsViewController

@synthesize chartView = _chartView;
@synthesize chartContainer, phContainer;

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
    [self update];
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

- (WordStatisticsViewController*)init:(WordVirtualActor*)wordVirtualActor
{
    //
    _wordVirtualActor = wordVirtualActor;
    
    return self;
}

#pragma mark - 

- (void)update
{
    //
    NSMutableArray* array = [_wordVirtualActor getHisRecords];
    [_chartView setType:WORD];
    [_chartView setPoints:array];
    
    if ([array count] <= 2) {
        [self.phContainer setHidden:NO];
        [self.chartContainer setHidden:YES];
    }
}

#pragma - UITableViewDelegate



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
    
    headerView.titleLabel.text = @"迅辞智能词汇分析";
    
    return headerView;
}

// Section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* WordBooksTableViewCellIndentifier = @"WordStatisticsTableViewCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WordBooksTableViewCellIndentifier];
    if (cell == nil) {
        // need [ autorealse]
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordBooksTableViewCellIndentifier];
    }
    
    // Configure cell
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                {
                    [((InfoCell*)cell).infoLabel setText:@"记忆程度"];
                    
                    //
                    WordRecord* wr = _wordVirtualActor.wordRecord;
                    int lvl = [wr.level intValue];
                    int rnd = rand() % 100;
                    int deg;
                    if (lvl == -1) {
                        deg = 1000;
                    }
                    else if (lvl == 0) {
                        deg = 1000;
                    }
                    else {
                        deg = (lvl - 1) * 100 + rnd;
                    }
                    float fdeg = (float)deg / 10;
                    
                    [((InfoCell*)cell).valuLabel setText:[NSString stringWithFormat:@"%.1f%%", fdeg]];
                    
                    break;
                }   
                case 1:
                {
                    [((InfoCell*)cell).infoLabel setText:@"难度评估"];
                    
                    [((InfoCell*)cell).valuLabel setText:@"简单"];
                    
                    break;
                }   
                default:
                { 
                    break;
                }
            }
            
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
