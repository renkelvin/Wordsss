//
//  ProfileViewController.m
//  Wordsss
//
//  Created by Ren Kelvin on 10/1/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import "ProfileViewController.h"

static char* nameArray[11] = {
    "NONE",             // 0  - 1     - Zero
    "Basic",            // 1  - 800   - Basic
    "Middle",           // 2  - 1500  - Middle
    "High",             // 3  - 3000  - High
    "CET4",             // 4  - 4000  - CET4
    "CET6",             // 5  - 6000  - CET6
    "IELTS",            // 6  - 8000  - IELTS
    "TOFEL",            // 7  - 9000  - TOFEL
    "SAT",              // 8  - 10000 - SAT
    "GRE",              // 9  - 12448 - GRE
    "GODLIKE"           // 10 - 42814 - HolyShit
};

@implementation ProfileViewController

@synthesize nameTitleLabel;
@synthesize infoLeftLabel, infoRightLabel;
@synthesize progressImageView, tagetLabel;
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
    //    [self initNavigationBar];
    
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

- (void)viewWillAppear:(BOOL)animated
{
    //
    //    [self initNavigationBar];
    [[[self navigationController] navigationBar] setBackgroundImage:[UIImage imageNamed:@"topbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    //
    [self update];
}

#pragma mark - 

- (NSString*)getEval
{
    NSArray* array = [_profileVirtualActor getStaRecords];
    
    if ([array count] == 0) {
        return @"无法评价";
    }
    
    NSDate* staDate = ((StaRecord*)[array objectAtIndex:0]).date;
    NSDate* endDate = [NSDate date];
    NSTimeInterval inter = [endDate timeIntervalSinceDate:staDate];
    
    int nowVoca = [_profileVirtualActor getVocaNow] - [_profileVirtualActor getVocaCurrent];
    int tarVoca = [_profileVirtualActor getVocaTarget] - [_profileVirtualActor getVocaCurrent]; 
    
    // 背85%足已
    tarVoca *= 0.85;
    
    float percent = (float)nowVoca/(float)tarVoca;
    inter /= percent;
    
    int month = (int)inter / (60*60*24*30);
    inter = (int)inter % (60*60*24*30);
    
    //
    NSString* string = [NSString string];
    if (month >= 4) {
        string = @"加快速度";
    }
    else {
        string = @"又快又好";
    }
    
    return string;
}

- (void)updateTitle
{
    // Name label
    [self.nameTitleLabel setText:_profileVirtualActor.user.profile.nickname];
    
    // Left label
    int nowVoca = [_profileVirtualActor getVocaNow];
    int tarVoca = [_profileVirtualActor getVocaTarget]; 
    [self.infoLeftLabel setText:[NSString stringWithFormat:@"%d / %d", nowVoca, tarVoca]];
    
    // Right labelr
    [self.infoRightLabel setText:[NSString stringWithFormat:[self getEval]]];
    
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
    NSString* string = [NSString stringWithCString:nameArray[[_profileVirtualActor.user.defult.targetLevel intValue]] encoding:4];
    [self.tagetLabel setText:string];
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
                    [((InfoCell*)cell).infoLabel setText:@"学习时间"];
                    
                    NSString* string = nil;
                    NSArray* array = [_profileVirtualActor getStaRecords];
                    if ([array count] == 0) {   //
                        string = @"0天";
                    }
                    else {  //
                        NSDate* staDate = ((StaRecord*)[array objectAtIndex:0]).date;
                        NSDate* endDate = [NSDate date];
                        NSTimeInterval inter = [endDate timeIntervalSinceDate:staDate];
                        
                        int month = (int)inter / (60*60*24*30);
                        inter = (int)inter % (60*60*24*30);
                        int day = (int)inter / (60*60*24);
                        
                        string = [NSString stringWithFormat:@"%d天", day];
                        if (month) {
                            string = [[NSString stringWithFormat:@"%d月 ", month] stringByAppendingString:string];
                        }
                    }
                    
                    [((InfoCell*)cell).valuLabel setText:string];
                    
                    break;
                }   
                case 1:
                {
                    [((InfoCell*)cell).infoLabel setText:@"预计完成时间"];
                    
                    NSString* string = nil;
                    NSArray* array = [_profileVirtualActor getStaRecords];
                    if ([array count] == 0) {   //
                        string = @"无法计算";
                    }
                    else {  //
                        NSDate* staDate = ((StaRecord*)[array objectAtIndex:0]).date;
                        NSDate* endDate = [NSDate date];
                        NSTimeInterval inter = [endDate timeIntervalSinceDate:staDate];
                        
                        int nowVoca = [_profileVirtualActor getVocaNow] - [_profileVirtualActor getVocaCurrent];
                        int tarVoca = [_profileVirtualActor getVocaTarget] - [_profileVirtualActor getVocaCurrent]; 
                        
                        // 背85%足已
                        tarVoca *= 0.85;
                        
                        float percent = (float)nowVoca/(float)tarVoca;
                        inter /= percent;
                        
                        int month = (int)inter / (60*60*24*30);
                        inter = (int)inter % (60*60*24*30);
                        int day = (int)inter / (60*60*24);
                        
                        string = [NSString stringWithFormat:@"%d天", day];
                        if (month) {
                            string = [[NSString stringWithFormat:@"%d月 ", month] stringByAppendingString:string];
                        }
                    }
                    
                    [((InfoCell*)cell).valuLabel setText:string];
                    
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

//#pragma - RKNavigationControllerDelegate
//
//- (void)initNavigationBar
//{    
//    RKNavigationController* navigationController = (RKNavigationController*)[self navigationController];
//    
//    [[navigationController backgroundImageView] setImage:[UIImage imageNamed:@"topbar_bg.png"]];
//    
//    [[navigationController titleLabel] setText:_profileVirtualActor.user.profile.nickname];
//    [[navigationController titleImageView] setImage:nil];
//    [[navigationController leftButton] setImage:nil forState:UIControlStateNormal];
//    [[navigationController rightButton] setImage:nil forState:UIControlStateNormal];
//}
//
//- (void)navigationBarLeftButtonDown
//{
//    
//}
//
//- (void)navigationBarRightButtonDown
//{
//    
//}

@end
