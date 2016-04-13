//
//  ViewController.m
//  MapViews
//
//  Created by vagelis spirou on 12/4/16.
//  Copyright © 2016 Vangelis Spyrou. All rights reserved.
//

#import "ViewController.h"
#import "MapPin.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.Mapview.delegate = self;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    // With display a specific location that we choose (Acropolis Athens) www.gps-coordinates.net
    
    MKCoordinateRegion region = {{0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude = 37.9715323;
    region.center.longitude = 23.725749199999996;
    
    // Add the zoom in level - Προσθέτουμε τι ζούμ θα κάνει οταν προβάλει το σημειο που εχουμε βαλει.
    
    region.span.latitudeDelta = 0.01f;    // Όσο μικραίνει το νούμερο τοσο περισσότερο ζουμ κάνει στον χάρτη μας
    region.span.longitudeDelta = 0.01f;   // Όσο μικραίνει το νούμερο τοσο περισσότερο ζουμ κάνει στον χάρτη μας
    [self.Mapview setRegion:region animated:YES];
    
    // Προσθέτουμε το pin και το annotation (σχόλιο)
    
    MapPin *myPin = [[MapPin alloc] init];
    myPin.title = @"Acropolis";
    myPin.subtitle = @"Athens";
    myPin.coordinate = region.center;
    [self.Mapview addAnnotation:myPin];
    
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


// Εδώ θα μας δίνει την διαδρομή απο το σημείο που θα επιλέγουμε μεχρι το pin μας. Χρησιμοποιούμε ενα string που ειναι η διευθυνση μας
// μεσα απο την web εφαρμογη apple map.

- (IBAction)Route:(id)sender {
    
    NSString *urlstring = @"http://maps.apple.com/maps?daddr=37.9715323,23.725749199999996";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlstring]];
    
    
    
}






@end
