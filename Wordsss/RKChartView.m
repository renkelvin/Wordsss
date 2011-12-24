//
//  RKChartView.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/25/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "RKChartView.h"

@implementation RKChartView

@synthesize points;
@synthesize type;
@synthesize staDay;
@synthesize endDay;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Line width
    CGContextSetLineWidth(context, 2.0);
    
    // Line Color
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
    CGColorRef color = CGColorCreate(colorspace, components);
    CGContextSetStrokeColorWithColor(context, color);
    
    //
    switch (self.type) {
        case USER:
        {
            
            break;
        }   
        case WORD:
        {
            break;
        }
        default:
        {   
            break;
        }
    }
    
    //
    //    CGPoint a, b;
    //    for (RKPoint* p in points) {
    //        CGContextMoveToPoint(context, a.x*10, a.y);
    //        b = p.point;
    //        CGContextAddLineToPoint(context, b.x*10, b.y);
    //        a = b;
    //    }
    
    //
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}

@end
