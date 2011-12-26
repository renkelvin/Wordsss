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

#define kMinX   0.0
#define kMaxX   320.0
#define kMinY   0.0
#define kMaxY   131.0

@interface RKChartView : UIView

enum RKChartType {USER, WORD};

@property (nonatomic, retain) NSArray* points;

@property (nonatomic) enum RKChartType type;

@property (nonatomic) int minDay;
@property (nonatomic) int maxDay;
@property (nonatomic) float minValue;
@property (nonatomic) float maxValue;

@end
