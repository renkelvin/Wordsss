//
//  RKTabBarController.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-3.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "RKTabBarController.h"

@implementation RKTabBarController

@synthesize buttons;

static BOOL FIRSTTIME = YES;

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
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    if (FIRSTTIME) {
        // [self hideBuiltinTabBar];
        [self showCustomTabBar];
        FIRSTTIME = NO;
    }
    
    //
    self.selectedIndex = 2;
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

// Hide builtin tabbar
- (void)hideBuiltinTabBar{
	for(UIView *view in self.view.subviews){
		if([view isKindOfClass:[UITabBar class]]){
			view.hidden = YES;
			break;
		}
	}
}

// Show custom tabbar
- (void)showCustomTabBar{
    
    //
    CGRect tabBarFrame = CGRectMake(0, 480 - 62, 320, 62);    
	customTabBarView = [[[NSBundle mainBundle] loadNibNamed:@"RKTabBarController" owner:self options:nil] lastObject];
    [customTabBarView setFrame:tabBarFrame];
    	
	// Create buttons
	int viewCount = self.viewControllers.count;
	self.buttons = [NSMutableArray arrayWithCapacity:viewCount];
	for (int i = 0; i < viewCount; i++) {
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
		btn.tag = i;
		[btn addTarget:self action:@selector(selectTab:) forControlEvents:UIControlEventTouchUpInside];
		switch (i)
        {
            case 0:
            {
                btn.frame = CGRectMake(32 - 25, 62 - 49 + 1, 50, 48);
                [btn setImage:[UIImage imageNamed:@"profile.png"] forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:@"profile_active.png"] forState:UIControlStateSelected];
                break;
            }
            case 1:
            {
                btn.frame = CGRectMake(96 - 25, 62 - 49 + 1, 50, 48);
                [btn setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:@"search_active.png"] forState:UIControlStateSelected];
                break;
            }
            case 2:
            {
                btn.frame = CGRectMake(160 - 25, 31 - 23, 50, 50);
                [btn setImage:[UIImage imageNamed:@"tab_wordtoday.png"] forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:@"nothing.png"] forState:UIControlStateHighlighted];
                break;
            }
            case 3:
            {
                btn.frame = CGRectMake(224 - 25, 62 - 49 + 1, 50, 48);
                [btn setImage:[UIImage imageNamed:@"wordlist.png"] forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:@"wordlist_active.png"] forState:UIControlStateSelected];
                break;
            }
            case 4:
            {
                btn.frame = CGRectMake(288 - 25, 62 - 49 + 1, 50, 48);
                [btn setImage:[UIImage imageNamed:@"settings.png"] forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:@"settings_active.png"] forState:UIControlStateSelected];
                break;
            }
        }
		
		[self.buttons addObject:btn];
		[customTabBarView addSubview:btn];
	}
    
	[self.view addSubview:customTabBarView];
}

// 
- (void)selectTab:(UIButton *)button
{
    
    //
    if (self.selectedIndex == button.tag) {
        [[self.viewControllers objectAtIndex:button.tag] popToRootViewControllerAnimated:YES];
        return;
    }
    
    // Change selected
    self.selectedIndex = button.tag;
    // button.tag==4时似乎系统有bug，用下面的方法折衷
    if (button.tag == 4) {
        self.selectedViewController = [self.viewControllers lastObject];
    }
    
    // Change image
    for (UIButton* btn in [self buttons]) {
        [btn setSelected:NO];
    }
    [button setSelected:YES];
}

@end