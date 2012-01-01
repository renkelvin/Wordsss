//
//  ProfileViewController.m
//  Wordsss
//
//  Created by Ren Kelvin on 10/1/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import "ProfileViewController.h"

@implementation ProfileViewController

@synthesize infoLeftLabel, infoRightLabel;
@synthesize progressImageView, tagetImageView;
@synthesize chartView = _chartView;

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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    _profileVirtualActor = [ProfileVirtualActor profileVirtualActor];
    
    //
    [self initNavigationBar];
    
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

#pragma mark - 

- (void)updateTitle
{
    // Left label
    int nowVoca = [_profileVirtualActor getVocaNow];
    int tarVoca = [_profileVirtualActor getVocaTarget]; 
    [self.infoLeftLabel setText:[NSString stringWithFormat:@"%d / %d", nowVoca, tarVoca]];
    
    // Right label
    [self.infoRightLabel setText:[NSString stringWithFormat:@"非常好"]];
    
    // Progress circle
    int percent = (int)((float)nowVoca/(float)tarVoca * 100);
    
    NSString* imgString = nil;
    if (0 <= percent && percent <= 0) {
        imgString = @"process_0.png";
    }
    else if (0 < percent && percent <= 8) {
        imgString = @"process_8.png";
    }
    else if (8 < percent && percent <= 17) {
        imgString = @"process_17.png";
    }
    else if (17 < percent && percent <= 25) {
        imgString = @"process_25.png";
    }
    else if (25 < percent && percent <= 34) {
        imgString = @"process_34.png";
    }
    else if (34 < percent && percent <= 42) {
        imgString = @"process_42.png";
    }
    else if (42 < percent && percent <= 50) {
        imgString = @"process_50.png";
    }
    else if (50 < percent && percent <= 60) {
        imgString = @"process_60.png";
    }
    else if (60 < percent && percent <= 68) {
        imgString = @"process_68.png";
    }
    else if (68 < percent && percent <= 76) {
        imgString = @"process_76.png";
    }
    else if (76 < percent && percent <= 84) {
        imgString = @"process_84.png";
    }
    else if (84 < percent && percent <= 92) {
        imgString = @"process_92.png";
    }
    else if (92 < percent && percent <= 100) {
        imgString = @"process_100.png";
    }
    
    [self.progressImageView setImage:[UIImage imageNamed:imgString]];
    
    // Target Label
    // TODO
}

- (void)update
{
    //
    [self updateTitle];
        
    //
    [_chartView setType:USER];
    [_chartView setPoints:[_profileVirtualActor getStaRecords]];
}

#pragma mark - UITableViewDelegate



#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    RKTableHeader *headerView = [[[NSBundle mainBundle] loadNibNamed:@"RKDashBoard" owner:self options:nil] objectAtIndex:0];
    
    [headerView setBackgroundColor:[UIColor clearColor]];
    
    headerView.titleLabel.text = @"迅辞动态学习计划";
    
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
    static NSString* WordBooksTableViewCellIndentifier = @"ProfileTableViewCell";
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
                    UILabel *label = [[UILabel alloc] init];
                    label.frame = CGRectMake(12, 0, 320, 42);
                    label.textColor = [UIColor whiteColor];
                    label.backgroundColor = [UIColor clearColor];
                    //                    headerView.titleLabel.text = [NSString stringWithFormat:@"Day: "];
                    [cell addSubview:label];
                    
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

#pragma - RKNavigationControllerDelegate

- (void)initNavigationBar
{    
    RKNavigationController* navigationController = (RKNavigationController*)[self navigationController];
    
    [[navigationController titleLabel] setText:_profileVirtualActor.user.profile.nickname];
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
