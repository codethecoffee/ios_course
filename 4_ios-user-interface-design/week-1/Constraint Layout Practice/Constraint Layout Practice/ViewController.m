//
//  ViewController.m
//  Constraint Layout Practice
//
//  Created by Suzy Lee on 8/3/20.
//  Copyright © 2020 Suzy Lee. All rights reserved.
//

#import "ViewController.h"
#import "MapKit/MapKit.h"
#import "WebKit/WebKit.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *webURL = @"https://careers.google.com/jobs/results/?company=Google&company=YouTube&hl=en&jlo=en-US&location=Seoul,%20South%20Korea";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:webURL]];
    [self.webView loadRequest:request];
    
    // Add Google Korea marker to mapView
    double latitude = 37.500126;
    double longitude = 127.036403;
    
    MKPointAnnotation *googleAnno = [[MKPointAnnotation alloc] init];
    googleAnno.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    googleAnno.title = @"Google Seoul Office";
    
    [_mapView addAnnotation:googleAnno];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(googleAnno.coordinate, 10000, 10000);
    MKCoordinateRegion croppedMap = [_mapView regionThatFits:region];
    [_mapView setRegion:croppedMap animated:YES];
    
    
}


@end
