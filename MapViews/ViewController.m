//
//  ViewController.m
//  MapViews
//
//  Created by vagelis spirou on 12/4/16.
//  Copyright © 2016 Vangelis Spyrou. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.Mapview.delegate = self;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ChangeMap:(id)sender {
    
    if (self.segmentControl.selectedSegmentIndex == 0) {
        self.Mapview.mapType = MKMapTypeStandard;
    }
    if (self.segmentControl.selectedSegmentIndex == 1) {
        self.Mapview.mapType = MKMapTypeSatellite;
    }
    if (self.segmentControl.selectedSegmentIndex == 2) {
        self.Mapview.mapType = MKMapTypeHybrid;
    }
}

- (IBAction)locateMe:(id)sender {
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    
    [locationManager startUpdatingLocation];
    
    self.Mapview.showsUserLocation = YES;
}
@end
