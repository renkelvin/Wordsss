//
//  WordStatisticsViewController.h
//  Wordsss
//
//  Created by Ren Kelvin on 10/5/11.
//  Copyright 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WordVirtualActor.h"

#import "UserDataManager.h"

#import "RKChartView.h"
#import "RKTableHeader.h"

#import "InfoCell.h"

@interface WordStatisticsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    //
    WordVirtualActor* _wordVirtualActor;
    
    //
    RKChartView* _chartView;
}

@property (nonatomic, retain) IBOutlet RKChartView* chartView;

- (WordStatisticsViewController*)init:(WordVirtualActor*)wordVirtualActor;

- (void)update;

@end
