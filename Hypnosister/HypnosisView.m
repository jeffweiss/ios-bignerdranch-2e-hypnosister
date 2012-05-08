//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Jeff Weiss on 1/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (void) drawRect:(CGRect)rect {
    //what rectangle am I filling?
    CGRect bounds = [self bounds];
    
    //Where is its center?
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //from the center how far out to corner?
    // take the triangle that is the width on one side, and the height on another,
    // and the hypotoneus that connects them througgh the center of the screen
    // half of this will be the maximum radius from the center
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //All lines will be drawn 10 points wide
    CGContextSetLineWidth(context, 10);
    
    //Set the stroke color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    //draw concentric circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        CGContextStrokePath(context);
    }
    
    //Create a string
    NSString *text = @"You are getting sleepy.";
    
    // Get a font to draw it in
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    //Where am I going to draw it?
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor] setFill];
    
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    //draw the string
    [text drawInRect:textRect
            withFont:font];
    
}

@end
