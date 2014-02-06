//
//  ViewController.h
//  iFastFood
//
//  Created by Lucas on 05/02/14.
//  Copyright (c) 2014 Mackenzie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
    __weak IBOutlet MKMapView *mapView;
    CLLocationManager *locationManager;
}

@property (weak, nonatomic) IBOutlet UISegmentedControl *mapTypeSegmentControl;
-(void)zoomToFitMapAnnotations;
- (IBAction)mapTypeChanged:(id)sender;
- (IBAction)searchFastFood:(id)sender;

@end
