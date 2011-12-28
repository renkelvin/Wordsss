//
//  WordRelationsViewController.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-6.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "WordRelationsViewController.h"

@implementation WordRelationsViewController

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

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

- (WordRelationsViewController*)init:(WordVirtualActor*)wordVirtualActor
{
    //
    _wordVirtualActor = wordVirtualActor;
    
    return self;
}

#pragma - UITableViewDelegate



#pragma - UITableViewDataSource

// Section number
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int num = 0;
    
    if ([[_wordVirtualActor getWordDerivative]count])
        num++;
    
    if (![[_wordVirtualActor getWordSynonym]count])
        num++;
    
    if (![[_wordVirtualActor getWordAntonym]count])
        num++;
    
    return num;
}

// Cell number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [[_wordVirtualActor getWordDerivative]count];
        case 1:
            return [[_wordVirtualActor getWordSynonym]count];
        case 2:
            return [[_wordVirtualActor getWordAntonym]count];
        default:
            return 0;
    }
}

// Header View
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:0];
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    // TitleLabel
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(12, 0, 320, 28);
    label.backgroundColor = [UIColor clearColor];
    
    switch (section) {
        case 0:
            label.text = @"派生词";
            break;
        case 1:
            label.text = @"同义词";
            break;
        case 2:
            label.text = @"反义词";
            break;
        default:
            label.text = @"-----";
            break;
    }
    
    [headerView addSubview:label];
    
    return headerView;
}

// Header height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            if (![[_wordVirtualActor getWordDerivative]count]) {
                return 0;
            }
        case 1:
            if (![[_wordVirtualActor getWordSynonym]count]) {
                return 0;
            }
        case 2:
            if (![[_wordVirtualActor getWordAntonym]count]) {
                return 0;
            }
        default:
            return 28;
    }
}

// Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* WordBooksTableViewCellIndentifier = @"WordRelationsTableViewCell";
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:WordBooksTableViewCellIndentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:WordBooksTableViewCellIndentifier];
    }
    
    return cell;
}

@end
