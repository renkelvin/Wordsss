//
//  RKChartView.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/25/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kStaX   0
#define kEndX   320

@interface RKChartView : UIView

enum RKChartType {USER, WORD};

@property (nonatomic, retain) NSDictionary* points;

@property (nonatomic) enum RKChartType type;

@property (nonatomic) int staDay;
@property (nonatomic) int endDay;

@end
