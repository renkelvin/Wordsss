//
//  HelpViewController.h
//  Wordsss
//
//  Created by Ren Chuan on 2/26/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RKTabBarController.h"
#import "TodayViewControllerV3.h"

@interface HelpViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, retain) IBOutlet UIScrollView* scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl* pageControl;

@property (nonatomic, retain) IBOutlet UIImageView* sampleImageView;

- (IBAction)dismiss:(id)sender;

@end
