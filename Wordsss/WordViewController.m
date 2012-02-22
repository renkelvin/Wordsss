//
//  WordViewController.m
//  Wordsss
//
//  Created by RenKelvin on 11-10-4.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import "WordViewController.h"

@implementation WordViewController

@synthesize word = _word;

@synthesize wordTitleLabel;

@synthesize transToListButton;

@synthesize sectionViewControllers;
@synthesize currentSectionView;

@synthesize wordBooksSectionButton;
@synthesize wordRelationsSectionButton;
@synthesize wordMemsSectionButton;
@synthesize wordStatisticsSectionButton;

@synthesize wordPosLevelImageView, wordPosLevelLeftImageView, wordPosLevelBodyImageView, wordPosLevelRightImageView;

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

// update
- (void)update
{    
    // WordPos Level Bar
    if ([_wordVirtualActor wordRecord]) {
        [self.wordPosLevelLeftImageView setHidden:NO];
        [self.wordPosLevelBodyImageView setHidden:NO];
        [self.wordPosLevelRightImageView setHidden:NO];
        
        int bodyWidth = 0;
        
        if ([[_wordVirtualActor wordRecord].level intValue] == -1) {
            bodyWidth = 281;
        }
        else {
            bodyWidth = 281 / 11.0 * [[_wordVirtualActor wordRecord].level intValue];
        }
        
        CGRect frame;
        
        frame = self.wordPosLevelBodyImageView.frame;
        frame.size.width = bodyWidth;
        self.wordPosLevelBodyImageView.frame = frame;
        
        frame = self.wordPosLevelRightImageView.frame;
        frame.origin.x = 20 + bodyWidth;
        self.wordPosLevelRightImageView.frame = frame;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    [self selectSectionWithIndex:0];
    
    //
    [self update];
}

- (void)viewWillAppear:(BOOL)animated
{
    //
    [[[self navigationController] navigationBar] setBackgroundImage:[UIImage imageNamed:@"topbar_bg.png"] forBarMetrics:UIBarMetricsDefault];
    [self.wordTitleLabel setText:_word.name];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - IBAction

- (IBAction)selectSectionButtonDown:(UIButton*)button
{
    [self selectSectionWithIndex:button.tag];
}

- (IBAction)navigationBackButtonClicked:(id)sender
{
    [[self navigationController] popViewControllerAnimated:YES];       
}

#pragma mark -

- (void)selectSectionWithIndex:(NSInteger)index
{
    // Change buttons
    [self.wordBooksSectionButton setSelected:NO];
    [self.wordRelationsSectionButton setSelected:NO];
    [self.wordMemsSectionButton setSelected:NO];
    [self.wordStatisticsSectionButton setSelected:NO];
    
    switch (index) {
        case 0:
            [self.wordBooksSectionButton setSelected:YES];
            break;
        case 1:
            [self.wordRelationsSectionButton setSelected:YES];
            break;
        case 2:
            [self.wordMemsSectionButton setSelected:YES];
            break;
        case 3:
            [self.wordStatisticsSectionButton setSelected:YES];
            break;            
        default:
            break;
    }
    
    // Remove old view
    [self.currentSectionView removeFromSuperview];
    
    // Add new view
    UIView* sectionView = [[self.sectionViewControllers objectAtIndex:index] view];
    self.currentSectionView = sectionView;
    [self.view addSubview:sectionView];
}

- (WordViewController*)init:(Word*)word and:(WordRecord*)wordRecord
{
    // Init word & wordVirtualActor
    _word = word;
    _wordVirtualActor = [WordVirtualActor wordVirtualActor:_word];
    _wordVirtualActor.wordRecord = wordRecord;
    
    //
    [self initSectionViewControllers];
    
    //
    return self;
}

- (void)initSectionViewControllers;
{
    // Get frame
    CGRect frame = kWordViewSectionFrame;
//    if (_word.word_list) {
//        Word_List* list = _word.word_list;
//        NSLog(@"%@", list.csListWord.meaning);
//        NSLog(@"%@", list.maListWord.meaning);
//        NSLog(@"%@", list.phListWord.meaning);
//        frame = kWordViewSectionFrameShort;
//        
//        // Show translate to list bar
//        [self.transToListButton setHidden:NO];
//    }
    
    // Set sections
    WordBooksViewController* wordBooksViewController = [((WordBooksViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"WordBooksViewController"]) init:_wordVirtualActor];
    [[wordBooksViewController view] setFrame:frame];
    
    WordRelationsViewController* wordRelationsViewController = [((WordRelationsViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"WordRelationsViewController"]) init:_wordVirtualActor];
    [wordRelationsViewController setWordViewController:self];
    [[wordRelationsViewController view] setFrame:frame];
    
    WordMemsViewController* wordMemsViewController = [((WordMemsViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"WordMemsViewController"]) init:_wordVirtualActor];
    [wordMemsViewController setWordViewController:self];
    [[wordMemsViewController view] setFrame:frame];
    
    WordStatisticsViewController* wordStatisticsViewController = [((WordStatisticsViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"WordStatisticsViewController"]) init:_wordVirtualActor];
    [[wordStatisticsViewController view] setFrame:frame];
    
    // Add
    NSMutableArray* tempViewControllersArray = [NSMutableArray arrayWithCapacity:4];
    [tempViewControllersArray addObject:wordBooksViewController];
    [tempViewControllersArray addObject:wordRelationsViewController];
    [tempViewControllersArray addObject:wordMemsViewController];
    [tempViewControllersArray addObject:wordStatisticsViewController];
    
    // Set
    [self setSectionViewControllers:tempViewControllersArray];
}

//#pragma mark - RKNavigationControllerDelegate
//
//- (void)initNavigationBar
//{
//    RKNavigationController* navigationController = (RKNavigationController*)[self navigationController];
//    
//    [[navigationController backgroundImageView] setImage:[UIImage imageNamed:@"topbar_bg.png"]];
//    
//    if (_word)
//        [[navigationController titleLabel] setText:_word.name];
//    
//    [[navigationController titleImageView] setImage:nil];
//    [[navigationController leftButton] setImage:[UIImage imageNamed:@"button_back.png"] forState:UIControlStateNormal];
//    [[navigationController rightButton] setImage:[UIImage imageNamed:@"info_gre.png"] forState:UIControlStateNormal];
//    
//    [UIView animateWithDuration:0.3 animations:^(void){
//        [[navigationController titleLabel] setAlpha:1.0];
//        [[navigationController titleImageView] setAlpha:1.0];
//        [[navigationController leftButton] setAlpha:1.0];
//        [[navigationController rightButton] setAlpha:1.0];
//    }];
//}
//
//- (void)navigationBarLeftButtonDown
//{
//    RKNavigationController* navigationController = (RKNavigationController*)[self navigationController];
//    
//    [UIView animateWithDuration:0.3 animations:^(void){
//        [[navigationController todayBackgroundImageView] setAlpha:0.0];
//        
//        [[navigationController titleLabel] setAlpha:0.0];
//        [[navigationController titleImageView] setAlpha:0.0];
//        [[navigationController leftButton] setAlpha:0.0];
//        [[navigationController rightButton] setAlpha:0.0];
//    }];
//    
//    [[self navigationController] popViewControllerAnimated:YES];       
//}
//
//- (void)navigationBarRightButtonDown
//{
//    
//}

#pragma mark - UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [[self navigationController] setDelegate:(id<UINavigationControllerDelegate>)viewController];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //    [self initNavigationBar];
}

@end
