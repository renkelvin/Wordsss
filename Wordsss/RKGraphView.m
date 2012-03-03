//
//  RKGraphView.m
//  Wordsss
//
//  Created by Ren Chuan on 2/29/12.
//  Copyright (c) 2012 Ren Inc. All rights reserved.
//

#import "RKGraphView.h"

@implementation RKGraphView

@synthesize type;

@synthesize percent;

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
    CGContextSetLineWidth(context, 3.0);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    // Line Color
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components1[] = {153 / 255.0, 153 / 255.0, 153 / 255.0, 1.0};
    CGColorRef color1 = CGColorCreate(colorspace, components1);

    CGFloat components2[] = {61 / 255.0, 131 / 255.0, 170 / 255.0, 1.0};
    CGColorRef color2 = CGColorCreate(colorspace, components2);
    
    switch (self.type) {
        case LEFT:
        {
            CGContextSetStrokeColorWithColor(context, color1);
            break;
        }   
        case RIGHT:
        {
            CGContextSetStrokeColorWithColor(context, color2);
            break;
        }   
        default:
            break;
    }
        
    // Shadow Color
    CGFloat componentsShadow[] = {0.0, 0.0, 0.0, 1.0};
    CGColorRef colorShadow = CGColorCreate(colorspace, componentsShadow);
    CGContextSetShadowWithColor(context, CGSizeMake(0, 2), 2.0, colorShadow);
    
    //
    CGFloat startAngle = 0.75*PI;
    CGFloat fullAngle = 2*PI - 2*(startAngle - PI/2);
    
    //
    UIBezierPath* aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(22.5, 22.5) radius:20.7 startAngle:startAngle endAngle:(startAngle + fullAngle*[self.percent floatValue]) clockwise:YES];
    [aPath setLineWidth:3.0];

    //
    [aPath stroke];
}

@end
