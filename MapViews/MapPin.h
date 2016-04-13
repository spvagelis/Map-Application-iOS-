//
//  MapPin.h
//  MapViews
//
//  Created by vagelis spirou on 13/4/16.
//  Copyright © 2016 Vangelis Spyrou. All rights reserved.
//



// Προσθέτουμε το annotation (σχόλιο) ως αντικείμενο

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MapPin : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
