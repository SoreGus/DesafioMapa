//
//  ViewController.m
//  iFastFood
//
//  Created by Lucas on 05/02/14.
//  Copyright (c) 2014 Mackenzie. All rights reserved.
//

#import "ViewController.h"
#import "SelectTableViewController.h"

@interface ViewController ()
{
    MKPointAnnotation *annotationPoint;
    NSString *name;
}
@end

@implementation ViewController

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    //mostra no mapa / zoom
    CLLocationCoordinate2D loc = [[locations lastObject] coordinate];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc,250,250);
    [mapView setRegion:region animated:YES];
    
}

//zomm out no mapa para ver as pins
-(void)zoomToFitMapAnnotations{
    
    if([mapView.annotations count] == 0)
        return;
    
    CLLocationCoordinate2D topLeftCoord;
    topLeftCoord.latitude = -90;
    topLeftCoord.longitude = 180;
    
    CLLocationCoordinate2D bottomRightCoord;
    bottomRightCoord.latitude = 90;
    bottomRightCoord.longitude = -180;
    
    for(annotationPoint in mapView.annotations)
    {
        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotationPoint.coordinate.longitude);
        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotationPoint.coordinate.latitude);
        
        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotationPoint.coordinate.longitude);
        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotationPoint.coordinate.latitude);
    }
    
    MKCoordinateRegion region;
    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.1; // Add a little extra space on the sides
    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.1; // Add a little extra space on the sides
    
    region = [mapView regionThatFits:region];
    [mapView setRegion:region animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //seta o delegate do map view
    [mapView setDelegate:self];
    mapView.showsUserLocation = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        locationManager.distanceFilter = 50.0;
        [locationManager startUpdatingLocation];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyThreeKilometers];
    }
    return self;
}

- (IBAction)mapTypeChanged:(id)sender
{
    //muda o tipo do mapa de acordo com a selecao do segment control
    if (self.mapTypeSegmentControl.selectedSegmentIndex == 0) {
        mapView.mapType = MKMapTypeStandard;
    } else if (self.mapTypeSegmentControl.selectedSegmentIndex == 1) {
        mapView.mapType = MKMapTypeSatellite;
    }
}

- (IBAction)searchFastFood:(id)sender
{
    //verifica se o nome nao é nulo e chama o método de busca de lugares
    if (name) {
        [self searchPlacesWithName:name];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"First select a place" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}

- (void)clearMap
{
    //verifica se há annotations no mapa e se tiver, os remove
    if (!mapView.annotations.count == 0) {
        [mapView removeAnnotations:mapView.annotations];
    }
}

- (void)searchPlacesWithName:(NSString *)aName
{
    //faz a busca de lugares
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.region = mapView.region;
    request.naturalLanguageQuery = aName;
    
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        
        //erro na busca
        if (error) {
            NSLog(@"Error %@", error);
            return;
        }
        //nao houve retorno na busca
        if (response.mapItems == 0) {
            NSLog(@"No results");
            return;
        }
        //chama o metodo que popula o mapa com os annotations points nos lugares achados
        [self populateMap:response.mapItems];
        
    }];
}

- (void)populateMap:(NSArray *)items
{
    [self clearMap];
    //para cada ponto, chama o metodo que adiciona annotation point
    for (MKMapItem *mapItem in items) {
        [self addAnnotationPointAt:mapItem.placemark.location.coordinate];
    }
}

- (void)addAnnotationPointAt:(CLLocationCoordinate2D)location
{
    //cria e adiciona a annotation no mapa
    annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = location;
    [mapView addAnnotation:annotationPoint];
    //metodo para dar zoom out
    [self zoomToFitMapAnnotations];
    
}

//unwind da table view de selecao de fast food
- (IBAction)selectionDone:(UIStoryboardSegue *)segue
{
    //cria um objeto do selectTableViewController e guarda o nome do fast food selecionado
    SelectTableViewController *controller = segue.sourceViewController;
    name = controller.fastFoodName;
    [self clearMap];
    [self searchPlacesWithName:name];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //verifica se é a segue correta
    if ([segue.identifier isEqualToString:@"selectionSegue"]) {
        //verifica se o nome nao esta nulo
        if (name)
        {
        //cria um objeto da table view e seta o nome da propriedade dela com o selecionado na ultima vez
        //serve para "relembrar" qual foi o ultimo fast food selecionado
        SelectTableViewController *controller = [segue destinationViewController];
        controller.fastFoodName = name;
        }
    }
}
















@end
