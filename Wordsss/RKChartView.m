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
    
    point.y = [sr.dlc floatValue];
    
    return point;
}

- (CGPoint)getCPL:(CGPoint)p0 leftPoint:(CGPoint)p1 rightPoint:(CGPoint)p2
{
    float x0 = p0.x, y0 = p0.y;
    float x1 = (p1.x + p0.x)/2, y1 = (p1.y + p0.y)/2;
    float x2 = (p0.x + p2.x)/2, y2 = (p0.y + p2.y)/2;
    
    float k = (y2 - y1)/(x2 - x1);
    float c = (x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1);
    
    float x3 = x0 - sqrt(c)/2/sqrt(1+k*k);
    float y3 = y0 - k*sqrt(c)/2/sqrt(1+k*k);
    
    return CGPointMake(x3, y3);
}

- (CGPoint)getCPR:(CGPoint)p0 leftPoint:(CGPoint)p1 rightPoint:(CGPoint)p2
{
    float x0 = p0.x, y0 = p0.y;
    float x1 = (p1.x + p0.x)/2, y1 = (p1.y + p0.y)/2;
    float x2 = (p0.x + p2.x)/2, y2 = (p0.y + p2.y)/2;
    
    float k = (y2 - y1)/(x2 - x1);
    float c = (x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1);
    
    float x4 = x0 + sqrt(c)/2/sqrt(1+k*k);
    float y4 = y0 + k*sqrt(c)/2/sqrt(1+k*k);
    
    return CGPointMake(x4, y4);
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
            // TOO few points 0 or 1
            if ([points count] == 0 || [points count] == 1) {
                break;
            }
            
            //
            self.staDay = [((StaRecord*)[points objectAtIndex:0]).day intValue];
            self.endDay = [((StaRecord*)[points lastObject]).day intValue];
            
            //
            UIBezierPath* aPath = [UIBezierPath bezierPath];
            
            [points enumerateObjectsUsingBlock:^(id obj, NSUInteger inx, BOOL *stop)
             {
                 // Move to first point
                 if (inx == 0) {
                     [aPath moveToPoint:[self getPoint:obj]];
                 }
                 
                 // Bazier to next point
                 else if (inx == 1) {
                     CGPoint p1 = [self getPoint:[points objectAtIndex:inx-1]];
                     CGPoint p2 = [self getPoint:[points objectAtIndex:inx]];
                     CGPoint pr = [self getPoint:[points objectAtIndex:inx+1]];
                     
                     CGPoint p4 = [self getCPL:p2 leftPoint:p1 rightPoint:pr];
                     
                     [aPath addCurveToPoint:p2 controlPoint1:p4 controlPoint2:p4];
                 }
                 else if (inx == [points count]-1) {
                     CGPoint p1 = [self getPoint:[points objectAtIndex:inx-1]];
                     CGPoint p2 = [self getPoint:[points objectAtIndex:inx]];
                     CGPoint pl = [self getPoint:[points objectAtIndex:inx-2]];
                     
                     CGPoint p3 = [self getCPR:p1 leftPoint:pl rightPoint:p2];
                     
                     [aPath addCurveToPoint:p2 controlPoint1:p3 controlPoint2:p3];
                 }
                 else {
                     CGPoint p1 = [self getPoint:[points objectAtIndex:inx-1]];
                     CGPoint p2 = [self getPoint:[points objectAtIndex:inx]];
                     CGPoint pl = [self getPoint:[points objectAtIndex:inx-2]];
                     CGPoint pr = [self getPoint:[points objectAtIndex:inx+1]];
                     
                     CGPoint p3 = [self getCPR:p1 leftPoint:pl rightPoint:p2];
                     CGPoint p4 = [self getCPL:p2 leftPoint:p1 rightPoint:pr];
                     
                     [aPath addCurveToPoint:p2 controlPoint1:p3 controlPoint2:p4];
                 }
             }];
            
            [aPath stroke];
            
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
