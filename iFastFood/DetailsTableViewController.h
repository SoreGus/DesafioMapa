//
//  DetailsTableViewController.h
//  iFastFood
//
//  Created by Lucas on 06/02/14.
//  Copyright (c) 2014 Mackenzie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailsTableViewController : UITableViewController

@property (weak, nonatomic) MKRoute *routeDetails;
@property (weak, nonatomic) NSString *name;
@end
