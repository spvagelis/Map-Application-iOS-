//
//  ViewController.h
//  MapViews
//
//  Created by vagelis spirou on 12/4/16.
//  Copyright © 2016 Vangelis Spyrou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@property (strong, nonatomic) IBOutlet MKMapView *Mapview;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;

- (IBAction)ChangeMap:(id)sender;
- (IBAction)locateMe:(id)sender;

@end

