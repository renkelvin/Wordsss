//
//  RKChartView.m
//  Wordsss
//
//  Created by Kelvin Ren on 12/25/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import "RKChartView.h"

@implementation RKChartView

@synthesize infoLabel, dateLabel;

@synthesize points;
@synthesize type;
@synthesize minDay;
@synthesize maxDay;
@synthesize minValue;
@synthesize maxValue;

@synthesize preRecord;

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
    float k = (float)([sr.day intValue] - minDay) / (float)(maxDay - minDay);
    point.x = (1 - k)*kMinX + k*kMaxX;
    
    // y
    float l = (float)([sr getCount] - minValue) / (float)(maxValue - minValue);
    point.y = (1 - l)*kMinY + l*kMaxY;
    
    return point;
}

- (CGPoint)getStaPoint:(HisRecord*)hr
{
    CGPoint point = CGPointMake(0, 0);
    
    // x
    float k = 1 - (float)(maxDay - [hr.day intValue]) / (float)(10);
    point.x = (1 - k)*kMinX + k*kMaxX;
    
    // y
    float l = 1.0;
    point.y = (1 - l)*kMinY + l*kMaxY;
    
    return point;
}

- (CGPoint)getEndPoint:(HisRecord*)hr
{
    CGPoint point = CGPointMake(0, 0);
    
    // x
    float k = 1 - (float)(maxDay - [hr.day intValue]) / (float)(10);
    point.x = (1 - k)*kMinX + k*kMaxX;
    
    // y
    float lev = [[self.preRecord level] floatValue];
    float l = (1 - (([hr.day floatValue]-[preRecord.day floatValue]) / (2*lev*lev)));
    l *= l;
    if ([hr.day intValue]-[preRecord.day intValue] > 2*lev*lev)
        l = 0;
    point.y = (1 - l)*kMinY + l*kMaxY;
    
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

//- (void)drawRect:(CGRect)rect
//{
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetRGBStrokeColor (context, 142.0/ 255.0, 161.0/ 255.0, 189.0/ 255.0, 1.0);
//    CGContextSetLineWidth(context, 30.0 );
//    CGContextMoveToPoint(context, 1.0 , 24.0 );
//    CGContextAddLineToPoint(context, 83.0 , 24.0 );
//    CGContextClosePath(context);
//    CGContextStrokePath(context);
//}

- (void)drawRect:(CGRect)rect
{
    // TOO few points 0 or 1 or 2
    if ([points count] == 0 || [points count] == 1) {
        return;
    }

    // Context
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Conordinate
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // Line width
    CGContextSetLineWidth(context, 3.0);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    // Line Color
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.2, 0.2, 0.7, 1.0};
    CGColorRef color = CGColorCreate(colorspace, components);
    CGContextSetStrokeColorWithColor(context, color);

    // Shadow Color
    CGFloat componentsShadow[] = {0.0, 0.0, 0.0, 1.0};
    CGColorRef colorShadow = CGColorCreate(colorspace, componentsShadow);
    CGContextSetShadowWithColor(context, CGSizeMake(2, 2), 0.1, colorShadow);
    
    //
    switch (self.type) {
        case USER:
        {        
            //
            self.minDay = [((StaRecord*)[points objectAtIndex:0]).day intValue];
            self.maxDay = [((StaRecord*)[points lastObject]).day intValue];
            
            self.maxValue = (float)((((int)[((StaRecord*)[points lastObject]) getCount]) / 100 + 1) * 100);
            if (self.maxValue <= 400) {
                self.minValue = 0;
            }
            else {
                self.minValue = self.maxValue - 4 * 100;
            }
            
            //
            for (int i =0; i < [points count]; i++) {
                StaRecord* sr = [points objectAtIndex:i];
                if ([sr getCount] < (int)self.minValue) {
                    [points removeObject:sr];
                }
                else {
                    break;
                }
            }
            
            // TOO few points 0 or 1 or 2
            if ([points count] == 0 || [points count] == 1 || [points count] == 2) {
                return;
            }
            
            //
            UIBezierPath* aPath = [UIBezierPath bezierPath];
            [aPath setLineWidth:3.0];
            
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
            
            //
            [aPath stroke];
            
            ProfileVirtualActor* pva = [ProfileVirtualActor profileVirtualActor];
            
            // Info label
            // float progress = (float)[pva getVocaNow] / (float)[pva getVocaTarget];
            int nowVoca = [pva getVocaNow];
            [self.infoLabel setText:[NSString stringWithFormat:@"迅辞记忆曲线 %d", nowVoca]];
            
            // Date label
            NSDate* date = ((StaRecord*)[self.points lastObject]).date;
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"YYYY 年 M 月 D 日"];
            [self.dateLabel setText:[dateFormatter stringFromDate:date]];
            
            break;
        }   
        case WORD:
        {
            //
            self.maxDay = [((HisRecord*)[points lastObject]).day intValue];
            self.minDay = self.maxDay - 14;
            
            self.maxValue = 100.0;
            self.minValue = 0.0;
            
            // TOO few points 0 or 1 or 2
            if ([points count] == 0 || [points count] == 1) {
                return;
            }
            
            //
            UIBezierPath* aPath = [UIBezierPath bezierPath];
            
            [points enumerateObjectsUsingBlock:^(id obj, NSUInteger inx, BOOL *stop)
             {
                 // Move to first point
                 if (inx == 0) {
                     //
                     self.preRecord = obj;
                     //
                     [aPath moveToPoint:[self getStaPoint:obj]];
                 }
                 
                 // Bazier to next point
                 else {
                     CGPoint p1 = [self getStaPoint:preRecord];
                     CGPoint p2 = [self getEndPoint:obj];
                     CGPoint p3 = CGPointMake(p1.x, p2.y);
                     CGPoint p4 = [self getStaPoint:obj];
                     
                     [aPath addQuadCurveToPoint:p2 controlPoint:p3];
                     
                     [aPath addLineToPoint:p4];
                     
                     self.preRecord = obj;
                 }
             }];
            
            //
            [aPath stroke];
            
            // Info label
            [self.infoLabel setText:[NSString stringWithFormat:@"记忆程度"]];
            
            // Date label
            NSDate* date = ((HisRecord*)[self.points lastObject]).date;
            if (!date) {
                date = [NSDate date];
            }
            NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"YYYY 年 M 月 D 日"];
            [self.dateLabel setText:[dateFormatter stringFromDate:date]];
            
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
