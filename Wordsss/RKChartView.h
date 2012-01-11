//
//  RKChartView.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/25/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HisRecord.h"
#import "StaRecord.h"

#import "ProfileVirtualActor.h"

#define kMinX   0.0
#define kMaxX   293.0
#define kMinY   2.0
#define kMaxY   129.0

@interface RKChartView : UIScrollView

enum RKChartType {USER, WORD};

@property (nonatomic, retain) IBOutlet UILabel* infoLabel;
@property (nonatomic, retain) IBOutlet UILabel* dateLabel;

@property (nonatomic, retain) NSMutableArray* points;

@property (nonatomic) enum RKChartType type;

@property (nonatomic) int minDay;
@property (nonatomic) int maxDay;
@property (nonatomic) float minValue;
@property (nonatomic) float maxValue;

@property (nonatomic, retain) HisRecord* preRecord;

@end
