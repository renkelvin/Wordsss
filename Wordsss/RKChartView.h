//
//  RKChartView.h
//  Wordsss
//
//  Created by Kelvin Ren on 12/25/11.
//  Copyright (c) 2011 Ren Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKPoint : NSObject {
    CGPoint _point;
}

@property (nonatomic) CGPoint point;

- (RKPoint*)x:(CGFloat)x y:(CGFloat)y;

@end

@interface RKChartView : UIView

@property (nonatomic, retain) NSArray* points;

@end
