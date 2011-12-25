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

- (CGPoint)getPoint:(StaRecord*)sr
{
    CGPoint point = CGPointMake(0, 0);
    
    // x
    float k = (float)([sr.day intValue] - staDay) / (float)(endDay - staDay);
    point.x = (1 - k)*kStaX + k*kEndX;
    
    // y
    float count =   [sr.count1 floatValue]*0.0 + 
                    [sr.count2 floatValue]*0.1 + 
                    [sr.count3 floatValue]*0.2 +
                    [sr.count4 floatValue]*0.3 + 
                    [sr.count5 floatValue]*0.4 + 
                    [sr.count6 floatValue]*0.5 + 
                    [sr.count7 floatValue]*0.6 +
                    [sr.count8 floatValue]*0.7 + 
                    [sr.count9 floatValue]*0.8 + 
                    [sr.count10 floatValue]*0.9 + 
                    [sr.countm floatValue]*1.0;
    point.y = count;
    
    return point;
}

- (void)drawRect:(CGRect)rect
{
    // Context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Conordinate
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
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
            self.staDay = [((StaRecord*)[points objectAtIndex:0]).day intValue];
            self.endDay = [((StaRecord*)[points lastObject]).day intValue];
            
            CGPoint a = CGPointMake(-1, 0), b = CGPointMake(0, 0);
            for (StaRecord* sr in points) {
                b = [self getPoint:sr];
                
                if (a.x == -1) {
                    a = b;
                    continue;
                }
                
                CGContextMoveToPoint(context, a.x, a.y);
                CGContextAddLineToPoint(context, b.x, b.y);
                
                a = b;
            }
            
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
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}

@end
