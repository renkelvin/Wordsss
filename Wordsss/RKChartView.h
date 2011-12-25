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

#define kStaX   0.0
#define kEndX   320.0
#define kStaY   0.0
#define kEndY   131.0

@interface RKChartView : UIView

enum RKChartType {USER, WORD};

@property (nonatomic, retain) NSArray* points;

@property (nonatomic) enum RKChartType type;

@property (nonatomic) int staDay;
@property (nonatomic) int endDay;

@end
