//
//  RKGraphView.h
//  Wordsss
//
//  Created by Ren Chuan on 2/29/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PI 3.14159265358979323846

@interface RKGraphView : UIView

enum RKGraphType {LEFT, RIGHT};

@property (nonatomic) enum RKGraphType type;

@property (nonatomic, retain) NSNumber* percent;

@end
