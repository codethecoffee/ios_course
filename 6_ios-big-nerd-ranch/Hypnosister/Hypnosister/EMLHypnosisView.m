//
//  EMLHypnosisView.m
//  Hypnosister
//
//  Created by Suzy Lee on 8/21/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "EMLHypnosisView.h"

@interface EMLHypnosisView ()
@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation EMLHypnosisView

- (instancetype)initWithFrame:(CGRect)frame {
    // Call the superclass initializer
    self = [super initWithFrame:frame];
    
    if (self) {
        self.circleColor = [UIColor lightGrayColor];
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Get the bounds of the current view
    CGRect bounds = self.bounds;
    
    // Calculate the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    
    
    // STEP 1: Configure the geometry (the path)
    // Instances of this class define and draw lines and
    // curves that you use to make shapes
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    
    // We will add multiple circles to this single path
    // instance, since that's more efficient!
    
    float maxRadius = MAX(bounds.size.width, bounds.size.height) / 2.0;
    
    for (float currRadius = maxRadius; currRadius > 0; currRadius-=20) {
        // By default, UIBezierPath will connect all the sub paths
        // (a.k.a. all the circles) to each other, like drawing
        // without taking your pencil off the paper.
        // Use moveToPoint to tell them when to lift the pencil
        // off the surface.
        [path moveToPoint:CGPointMake(center.x+currRadius, center.y)];
        
        // Now define the path the UIBezierPath must follow.
        [path addArcWithCenter:center radius:currRadius startAngle:0.0 endAngle:M_PI*2.0 clockwise:YES];
    }
    
    // STEP 2: Edit the properties of the path
    //         to further customize its look
    path.lineWidth = 10;
    // Set the drawing color
    [self.circleColor setStroke];
    
    // STEP 3: Draw the path with fill or stroke
    [path stroke];
    
    
    // Draw an image in a given CGRect
    CGRect photoBounds = CGRectMake(center.x-80, center.y-100, 170, 200);
    
    UIImage *androidLogo = [UIImage imageNamed:@"646px-Android_robot"];
    [androidLogo drawInRect:photoBounds];
}

/**
 touchesBegan:withEvent: method is triggered when a finger touches the screen
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ was touched", self);
    
    // Get 3 random numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    // Generate a random RGB color with those numbers
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    // Set the circle color to this random color
    self.circleColor = randomColor;
    
}

// Custom accessor for circleColor, so that view is redrawn
// whenever a change is made to the circle color
- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

@end
