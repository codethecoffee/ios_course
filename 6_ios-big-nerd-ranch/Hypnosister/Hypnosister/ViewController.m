//
//  ViewController.m
//  Hypnosister
//
//  Created by Suzy Lee on 8/21/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"
#import "EMLHypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Bounds of the entire window
    CGRect firstFrame = self.view.frame;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:firstFrame];
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    
    // First Hypnosis View
    EMLHypnosisView *hypnosisView = [[EMLHypnosisView alloc] initWithFrame:firstFrame];
    self.view.backgroundColor = [UIColor clearColor];
    
    [scrollView addSubview:hypnosisView];
    
    
    // Second Hypnosis View
    firstFrame.origin.x += firstFrame.size.width;
    EMLHypnosisView *secHypnosisView = [[EMLHypnosisView alloc] initWithFrame:firstFrame];
    [scrollView addSubview:secHypnosisView];
    
    
    // Tell the scroll view how big the content is
    // This will make our Hypnosis view much larger than the
    // phone screen (by a multipler of 2.0, to be precise)
    CGRect bigRect = firstFrame;
    bigRect.size.width *= 2.0;
    scrollView.contentSize = bigRect.size;
    
    
    
}


@end
