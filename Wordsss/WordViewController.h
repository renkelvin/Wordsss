//
//  WordViewController.h
//  Wordsss
//
//  Created by RenKelvin on 11-10-4.
//  Copyright 2011年 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WordBooksViewController.h"
#import "WordRelationsViewController.h"
#import "WordMemsViewController.h"
#import "WordStatisticsViewController.h"

#import "RKNavigationControllerDelegate.h"
#import "Word.h"

@interface WordViewController : UIViewController <RKNavigationControllerDelegate, UINavigationControllerDelegate>
{
    Word* _word;
}

@property (nonatomic, retain) IBOutlet UIButton* wordBooksSectionButton;
@property (nonatomic, retain) IBOutlet UIButton* wordRelationsSectionButton;
@property (nonatomic, retain) IBOutlet UIButton* wordMemsSectionButton;
@property (nonatomic, retain) IBOutlet UIButton* wordStatisticsSectionButton;

@property (nonatomic, retain) NSArray* sectionViewControllers;
@property (nonatomic, retain) UIView* currentSectionView;

- (id)initSectionViewControllers;

- (IBAction)selectSectionButtonDown:(UIButton*)button;
- (void)selectSectionWithIndex:(NSInteger)index;

@end
