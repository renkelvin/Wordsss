//
//  ProfileViewController.m
//  Wordsss
//
//  Created by Ren Kelvin on 10/1/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import "ProfileViewController.h"

static char* nameArray[13] = {
    "未制定",      // 0    - Zero
    "基础",       // 1    - Basic
    "初中",       // 2    - Middle
    "高中",       // 3    - High
    "CET4",     // 4    - CET4
    "CET6",     // 5    - CET6
    "考研",       // 6    - GET
    "IELTS",    // 7    - IELTS
    "TOEFL",    // 8    - TOEFL
    "SAT",      // 9    - SAT
    "GRE",      // 10   - GRE
    "GMAT",     // 11   - GMAT
    "超神"        // 12   - HolyShit
};

@implementation ProfileViewController

@synthesize nameTitleLabel;
@synthesize chartContainer, phContainer;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    _profileVirtualActor = [ProfileVirtualActor profileVirtualActor];
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
    [[[self navigationController] navigationBar] setBackgroundImage:[UIImage imageNamed:@"topbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    //
    [self update];
}

#pragma mark - 

- (NSString*)getEval
{
    NSString* string = [NSString string];
    
    NSArray* array = [_profileVirtualActor getStaRecords];    
    if ([array count] == 0) {
        return @"无法评价";
    }
    
    NSDate* staDate = ((StaRecord*)[array objectAtIndex:0]).date;
    NSDate* endDate = [NSDate date];
    NSTimeInterval inter = [endDate timeIntervalSinceDate:staDate];
    
    if (inter < 60*60*24) {
        string = @"无法评价";
    }
    else {
        int nowVoca = [_profileVirtualActor getVocaNow] - [_profileVirtualActor getVocaCurrent];
        int tarVoca = [_profileVirtualActor getVocaTarget] - [_profileVirtualActor getVocaCurrent]; 
        
        // 背85%足已
        // tarVoca *= 0.85;
        
        float percent = (float)nowVoca/(float)tarVoca;
        inter /= percent;
        
        int month = (int)inter / (60*60*24*30);
        inter = (int)inter % (60*60*24*30);
        
        //
        if (month >= 5) {
            string = @"目标太难";
        }
        else if (month == 4) {
            string = @"加快速度";
        }
        else if (month == 3) {
            string = @"又快又好";
        }
        else if (month == 2) {
            string = @"加深记忆";
        }
        else if (month == 1) {
            string = @"目标太低";
        }
        else {
            string = @"又快又好";
        }
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
    [self.infoRightLabel setText:[self getEval]];
    
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
    NSMutableArray* array = [_profileVirtualActor getStaRecords];
    [_chartView setType:USER];
    [_chartView setPoints:array];
    
    if ([array count] <= 2) {
        [self.phContainer setHidden:NO];
        [self.chartContainer setHidden:YES];
    }
    [_chartView setNeedsDisplay];
}

- (IBAction)evalQuesButtonClicked:(id)sender
{
    //
    NSString* string = self.infoRightLabel.text;
    
    NSString* title = string;
    NSString* message = nil;
    if ([string compare:@"目标太难"] == NSOrderedSame) {
        message = @"当前目标水平可能过高，可以适当降低目标来提升效率。";
    }
    else if ([string compare:@"加快速度"] == NSOrderedSame) {
        message = @"当前计划进展过慢，请适当增加学习时间。";
    }
    else if ([string compare:@"又快又好"] == NSOrderedSame) {
        message = @"当前的学习强度和记忆效率良好。";
    }
    else if ([string compare:@"加深记忆"] == NSOrderedSame) {
        message = @"当前记忆效果不如预期，可以适当减慢浏览速度认真记忆单词。";
    }
    else if ([string compare:@"目标太低"] == NSOrderedSame) {
        message = @"当前目标水平可能过低，可以适当提高目标来提升效率。";
    }
    else if ([string compare:@"无法评价"] == NSOrderedSame) {
        message = @"迅辞在一段时间后会根据您的学习情况自动在此处作出评价，请关注评价并作出相应调整。";
    }
    else {
        message = @"未知问题，无法评价";
    }
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil];
    [alert show];
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
                        string = @"刚刚开始";
                    }
                    else {  //
                        NSDate* staDate = ((StaRecord*)[array objectAtIndex:0]).date;
                        NSDate* endDate = [NSDate date];
                        NSTimeInterval inter = [endDate timeIntervalSinceDate:staDate];
                        
                        int month = (int)inter / (60*60*24*30);
                        inter = (int)inter % (60*60*24*30);
                        int day = (int)inter / (60*60*24);
                        inter = (int)inter % (60*60*24);
                        int hour = (int)inter / (60*60);
                        inter = (int)inter % (60*60);
                        
                        if (month == 0 && day == 0) {
                            string = [NSString stringWithFormat:@"%d 小时", hour];
                        }
                        else {
                            string = [NSString stringWithFormat:@"%d 天", day];
                            if (month) {
                                string = [[NSString stringWithFormat:@"%d 月 ", month] stringByAppendingString:string];
                            }
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
                        string = @"暂时无法计算";
                    }
                    else {  //
                        NSDate* staDate = ((StaRecord*)[array objectAtIndex:0]).date;
                        NSDate* endDate = [NSDate date];
                        NSTimeInterval inter = [endDate timeIntervalSinceDate:staDate];
                        
                        int nowVoca = [_profileVirtualActor getVocaNow] - [_profileVirtualActor getVocaCurrent];
                        int tarVoca = [_profileVirtualActor getVocaTarget] - [_profileVirtualActor getVocaCurrent]; 
                        
                        // 背85%足已
                        // tarVoca *= 0.85;
                        
                        float percent = (float)nowVoca/(float)tarVoca;
                        inter /= percent;
                        
                        int month = (int)inter / (60*60*24*30);
                        inter = (int)inter % (60*60*24*30);
                        int day = (int)inter / (60*60*24);
                        
                        string = [NSString stringWithFormat:@"%d 天", day];
                        if (month) {
                            if (month >= 4) {
                                month = 3;
                            }
                            
                            string = [[NSString stringWithFormat:@"%d 月 ", month] stringByAppendingString:string];
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

@end
