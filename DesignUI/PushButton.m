//
//  PushButton.m
//  DesignUI
//
//  Created by Luiz cavalieri on 26/04/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "PushButton.h"

@implementation PushButton

/*
 Only override drawRect: if you perform custom drawing.
 An empty implementation adversely affects performance during animation.
 
 */

- (void)drawRect:(CGRect)rect {
     //Drawing code
    
    
    CGRect bounds = self.bounds;
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithOvalInRect:bounds];
    
    [[self fillColor] setFill];
    
    [aPath fill];
    
    CGFloat plusLineLength = 60.0;
    CGFloat plusLineWidth = 3.0;
    
    UIBezierPath *plusPath = [[UIBezierPath alloc] init];
    [plusPath setLineWidth:plusLineWidth];
    [[UIColor whiteColor] setStroke];
    
    [plusPath moveToPoint:CGPointMake(bounds.size.width/2 - plusLineLength/2, bounds.size.height/2)];
    [plusPath addLineToPoint:CGPointMake(bounds.size.width/2 + plusLineLength/2, bounds.size.height/2)];
    
    if(self.isAdButton){
        [plusPath moveToPoint:CGPointMake(bounds.size.width/2, bounds.size.height/2 - plusLineLength/2)];
        [plusPath addLineToPoint:CGPointMake(bounds.size.width/2, bounds.size.height/2 + plusLineLength/2)];

    }
    
    
    [plusPath stroke];
    
    
}


@end
