//
//  CounterView.m
//  DesignUI
//
//  Created by Luiz cavalieri on 28/04/2016.
//  Copyright © 2016 The Interactive Hippo. All rights reserved.
//

#import "CounterView.h"

@implementation CounterView

@synthesize outerlineColor, counterColor;


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if(self != nil){
        _counter = 5;
    }
    
    return self;
    
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    // set the color for the elements that will be drawn
    [self setCounterColor:[UIColor colorWithRed:87.0f/255.0f green:218.0f/255.0f blue:213.0f/255.0f alpha:1.0f]];
    [self setOuterlineColor:[UIColor colorWithRed:34.0f/255.0f  green:110.0f/255.0f  blue:110.0f/255.0f  alpha:1.0f]];
    
    
    CGRect bounds = self.bounds;
    CGPoint center = CGPointMake(bounds.size.width/2, bounds.size.height/2);
    CGFloat radius = MIN(bounds.size.width, bounds.size.height)/2;
    
    CGFloat startAngle = 3 * M_PI / 4;
    CGFloat endAngle = M_PI / 4;
    CGFloat arcWidth = 76.0;
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:center
                                                         radius:radius - arcWidth/2
                                                     startAngle:startAngle
                                                       endAngle:endAngle
                                                      clockwise:YES];
    
    [aPath setLineWidth:arcWidth];
    
    [counterColor setStroke];
    
    [aPath stroke];
    
    
    CGFloat outlineWidth = 5.0;
    CGFloat angleDifference = 2 * M_PI  - startAngle + endAngle;
    CGFloat arcLengthPerSec = angleDifference / 8.0f;
    CGFloat outlineEndAngle = arcLengthPerSec * (CGFloat)[self counter] + startAngle;
    
    UIBezierPath *outlinePath = [UIBezierPath bezierPathWithArcCenter:center
                                                               radius:radius - outlineWidth/2
                                                           startAngle:startAngle
                                                             endAngle:outlineEndAngle
                                                             clockwise:YES];
    
    [outlinePath addArcWithCenter:center
                           radius:radius - arcWidth + outlineWidth/2
                       startAngle:outlineEndAngle
                         endAngle:startAngle
                        clockwise:NO];
    
    [outlinePath closePath];
    [outlinePath setLineWidth:outlineWidth];
    [outerlineColor setStroke];
    [outlinePath stroke];
    
}


@end
